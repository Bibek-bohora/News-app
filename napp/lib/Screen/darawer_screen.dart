import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 108, 4, 126)),
            accountName: Text(
              "BibekBohora",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              "bibchhetri@gmal.com",
              style: TextStyle(color: Color.fromARGB(255, 233, 247, 252)),
            ),
            currentAccountPicture: CircleAvatar(
                child: FlutterLogo(
              size: 50.0,
            )),
          ),
          Container(
            height: double.maxFinite,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return ListTile(
                      leading: Text("${index + 1}"), title: Text("hyelooo"));
                })),
          )
        ],
      ),
    );
  }
}
