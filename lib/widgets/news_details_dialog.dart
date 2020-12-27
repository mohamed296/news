import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NeWsDetailsDialog extends StatelessWidget {
  final String imag, details, title, url;

  const NeWsDetailsDialog({this.imag, this.details, this.title, this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              imag != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        imag,
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "T I T L E :",
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              details != null
                  ? Card(
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "D E T A I L S ",
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              details,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            FlatButton(
                                onPressed: () async {
                                  await launch("$url");
                                },
                                child: Text(
                                  "Click here to read more",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
