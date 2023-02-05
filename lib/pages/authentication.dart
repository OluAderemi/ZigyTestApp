import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:zigy_app_test/StandardElements/constants.dart';
import 'package:zigy_app_test/pages/list_users.dart';
import 'package:zigy_app_test/pages/single_user.dart';

import '../StandardElements/StandardWidgets/custom_text.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileView();
  }
}

class MobileView extends StatelessWidget {
  static var responseList;
  static var responseUser;

  Map data;
  static List listUsersData;
  static List singleUserData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 400),
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Hello",
                          style: GoogleFonts.roboto(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Welcome to my Zigy Test App.",
                        color: lightGrey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.offAllNamed(rootRoute);
                      ListUsers();
                      Timer(Duration(seconds: 5), () {
                        if (MobileView.responseList == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListUsersPage()));
                        } else {
                          var snackBar = SnackBar(
                              content: Text('Invalid Email or Password'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        ;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: zigyPrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CustomText(
                        text: "List Users",
                        color: Colors.white,
                        size: 22,
                        weight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      SingleUser();
                      Timer(Duration(seconds: 5), () {
                        if (MobileView.responseUser == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleUserPage()));
                        } else {
                          var snackBar = SnackBar(
                              content: Text('Invalid Email or Password'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        ;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: zigyPrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CustomText(
                        text: "Single User",
                        color: Colors.white,
                        size: 22,
                        weight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future ListUsers() async {
    var response = await http.get(
      Uri.parse("https://reqres.in/api/users?page=2"),
    );
    data = json.decode(response.body);
    listUsersData = data["data"];

    responseList = response.statusCode;
  }

  Future SingleUser() async {
    var response = await http.get(
      Uri.parse("https://reqres.in/api/users/2"),
    );
    print(response.body);
    data = json.decode(response.body);
    singleUserData = [data];

    responseUser = response.statusCode;
  }
}
