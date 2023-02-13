import 'package:flutter/material.dart';
import 'package:flutter_application_2/Reservation.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class ReserveTable extends StatefulWidget {
  ReserveTable({Key key}) : super(key: key);

  @override
  _ReserveTableState createState() => _ReserveTableState();
}

class _ReserveTableState extends State<ReserveTable> {
  var _calendarController = CalendarController();
  TimeOfDay _selectedTime;
  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay selected = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (selected != null && selected != _selectedTime) {
      setState(() {
        _selectedTime = selected;
      });
    }
  }

  int tablenum = 0;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Reserve a Table",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.white,
            ),
            Text(
              "Reserve a Table for",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            // "".text.color(Colors.black).bold.headline4(context).make(),
            Container(
              height: 60,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        tablenum = index + 1;
                        // print(index + 1);
                      },
                      child: Stack(
                        children: [
                          Icon(
                            Icons.accessibility,
                            size: 60,
                          ),
                          Positioned(
                            top: 20,
                            left: 25,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Reserve a Table on",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: Card(
                child: TableCalendar(
                  // startDay: DateTime.now(),
                  initialSelectedDay: DateTime.now(),
                  calendarController: _calendarController,
                  onDaySelected: (day, events, holidays) {
                    print("${day} ${events} $holidays}");
                    date = day;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Reserve a Table at",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 68.0, vertical: 8),
              child: RaisedButton(
                onPressed: () => _selectTime(context),
                child: Text('${_selectedTime.format(context)}'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
              child: RaisedButton(
                color: Colors.blue[900],
                onPressed: () {
                  if (tablenum == 0) {}
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Reservation(
                            time: _selectedTime.format(context),
                            selectdate: date,
                            person: tablenum),
                      ));
                },
                child: Text('Reserve'),
              ),
            ),
            // .text
            // .color(Colors.black)
            // .bold
            // .headline4(context)
            // .make(),
          ],
        ),
      ),
    );
  }
}
