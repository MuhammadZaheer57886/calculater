import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final List<Map<String, String>> history;

  const HistoryPage({super.key, required this.history});

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282828),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: widget.history.length,
              itemBuilder: (BuildContext context, int i) {
                String? input = widget.history[i]['input'];
                String? output = widget.history[i]['output'];
                return ListTile(
                  title: Text(
                    '$input = $output',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            color: const Color(0xFF202020),
            child: Center(
              child: Container(
                width: 200,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}