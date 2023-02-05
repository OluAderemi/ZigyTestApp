import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zigy_app_test/pages/authentication.dart';

class SingleUserPage extends StatefulWidget {
  const SingleUserPage({Key key}) : super(key: key);

  @override
  State<SingleUserPage> createState() => _SingleUserPage();
}

class _SingleUserPage extends State<SingleUserPage> {
  var singleUserData = MobileView.singleUserData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single User"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: singleUserData == null ? 0 : singleUserData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(singleUserData[index]["data"]["avatar"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${singleUserData[index]["data"]["first_name"]} ${singleUserData[index]["data"]["last_name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
