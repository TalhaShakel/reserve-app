import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Reservation extends StatelessWidget {
  String time;
  DateTime selectdate;
  int person;
  Reservation({
    Key key,
    this.person,
    this.selectdate,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = new DateFormat("MMMM");
    String monthName = formatter.format(selectdate);

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            "Reservations",
            style: TextStyle(
                color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.image,
                        size: 90,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bamboo balls",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Table for $person",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ON ${selectdate.day} ${monthName}",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "AT: $time",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
