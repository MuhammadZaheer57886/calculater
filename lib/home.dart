
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late PageController _pageController;

  String input = '';
  double output= 0;

  List<Map<String, String>> history = [];

  @override
  void initState() {
    
    super.initState();
    
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _submit() {
    if (input.isEmpty) {
      return null;
    }
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    if (mounted) {
      setState(() {
        output = exp.evaluate(EvaluationType.REAL, cm);
        history.add({
          'input': input,
          'output': output.toString(),
        });
      });
    }
  }

  Widget _calculatorPage() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          color: const Color(0xFF282828),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 28, bottom: 10),
                child: Text(
                  input,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 28, bottom: 28),
                child: Text(
                  output== 0? '' : output.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0xFF282828),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  // 1 row
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          
                          onPressed: () {
                            setState(() {
                              input.isEmpty
                                  ? null
                                  : input =
                                      input.substring(0, input.length - 2);
                            });
                          },
                          
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              input = '';
                              output = 0;
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.clear,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          
                          onPressed: () {
                            setState(() {
                              input += '% ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          
                          onPressed: () {
                            setState(() {
                              input += '/ ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '÷',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 2 row
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '7 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '7',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '8 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '9 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              input += '* ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.close,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 3 row
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '4 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '5 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '6 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '6',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              input += '- ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 42,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 4 row
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '1 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '2 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '3 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              input += '+ ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 42,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 5 row
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '^ ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '^',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                           
                          onPressed: () {
                            setState(() {
                              input += '0 ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              input += '. ';
                            });
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '.',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF7556),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFFFF7556),
                        ),
                        child: OutlinedButton(
                          onPressed: _submit,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '=',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        HistoryPage(history: history),
        _calculatorPage(),
      ],
    );
  }
}