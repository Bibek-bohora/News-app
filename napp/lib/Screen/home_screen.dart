import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:napp/widgets/news_cart.dart';
import '../constance/urlconstance.dart';
import 'darawer_screen.dart';
import "package:http/http.dart" as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

_getData() async {
  var url = Uri.parse(Url.newsapiendpoint);
  var response = await http.get(url);
  return jsonDecode(response.body.toString());
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.001,
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 108, 4, 126),
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ...snapshot.data["articles"]
                          .map((e) => getNews(e)) //if item in null
                    ],
                  );
                } else {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
