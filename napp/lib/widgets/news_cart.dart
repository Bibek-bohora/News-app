//making functional widgets

import 'package:flutter/material.dart';
import '../constance/urlconstance.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

//url_lunchers
_launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}

//getnews
getNews(e) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shadowColor: Colors.black,
        elevation: 2,
        borderOnForeground: true,
        child: Stack(children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
              child: Image.network(e["urlToImage"] ?? Url.imagelaceholde),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => _launchUrl(e["url"]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e["title"],
                      style: TextStyle(
                          color: Color.fromARGB(255, 108, 4, 126),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      e["description"] ?? "this is top headline .com",
                    )
                  ],
                ),
              ),
            )
          ]),
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () => Share.share('Read More News : ${e["url"]}'),
              child: Icon(
                Icons.share,
                size: 32,
                color: Color.fromARGB(255, 253, 252, 251),
              ),
            ),
          )
        ]),
      ),
    ),
  ]);
}
