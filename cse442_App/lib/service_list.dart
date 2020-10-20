import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'userListings_model.dart';

class ServiceList extends StatefulWidget {
  @override
  ServiceListState createState() => ServiceListState();
}

int _counter = 0;
List<UserListingsModel> testingUserList = new List<UserListingsModel>();

Widget getInformationBox(
    String jobType, String description, String dateCreated) {
  String finalDescriptionDisplay = "";
  if (description.length < 17) {
    finalDescriptionDisplay = description;
  } else {
    finalDescriptionDisplay = description.substring(0, 17);
  }

  return Container(
    margin: EdgeInsets.only(bottom: 10.0),
    alignment: Alignment.topLeft,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () {
        print('something');
      },
      padding: const EdgeInsets.only(
          bottom: 10.0, left: 20.0, right: 60.0, top: 10.0),
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue)),
      color: Colors.white,
      child: Text(
        "Job Type: " +
            jobType +
            "\n" +
            "Date Created: " +
            dateCreated.substring(0, 16) +
            "\n" +
            "Description: " +
            finalDescriptionDisplay,
        style: TextStyle(
          color: Colors.black,
          letterSpacing: 1.2,
          fontSize: 15.0,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

class ServiceListState extends State<ServiceList> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      returnInit();
    });
  }

  Future<List<UserListingsModel>> getListing() async {
    print("Getting listings");

    final String apiUrl = "https://job-5cells.herokuapp.com/allListings";
    final response = await http.get(apiUrl);

    final String temp = response.body;
    return userListingsModelFromJson(temp);
  }

  void returnInit() async {
    List<UserListingsModel> temporaryList = await getListing();
    setState(() {
      testingUserList = temporaryList;
      for (var userListings in testingUserList)
        print(userListings.jobType.toString() +
            ", " +
            userListings.description.toString() +
            "\n");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of Services"),
          centerTitle: true,
        ),
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 40.0,
              ),
              child: Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () async {
                        setState(() {});
                        testingUserList = await getListing();
                      },
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.white,
                      child: Text(
                        'refresh',
                        style: TextStyle(
                          color: Colors.blue,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    )),
                SizedBox(height: 30.0),
                for (var userListings in testingUserList)
                  getInformationBox(
                      userListings.jobType.toString(),
                      userListings.description.toString(),
                      userListings.createdAt.toString())
              ]),
            ),
          )
        ]));
  }
}