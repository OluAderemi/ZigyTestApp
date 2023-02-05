import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zigy_app_test/pages/authentication.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({Key key}) : super(key: key);

  @override
  State<ListUsersPage> createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  var listUsersData = MobileView.listUsersData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Users"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: listUsersData == null ? 0 : listUsersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(listUsersData[index]["avatar"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${listUsersData[index]["first_name"]} ${listUsersData[index]["last_name"]}",
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
