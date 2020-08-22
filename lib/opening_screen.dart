import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpeningScreen extends StatefulWidget {
  OpeningScreen({Key key}) : super(key: key);

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldState> scaffoldKey =
    new GlobalKey<ScaffoldState>();

class _OpeningScreenState extends State<OpeningScreen> {
  int index = 0;
  bool shouldOpen = false;
  @override
  Widget build(BuildContext context) {
    final _items = [
      Placeholder(
        color: Colors.black,
      ),
      Placeholder(
        color: Colors.green,
      ),
      Placeholder(
        color: Colors.yellow,
      ),
      Placeholder(
        color: Colors.blue,
      ),
      Placeholder(
        color: Colors.red,
      ),
    ];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Awsome Wheel"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.deepOrangeAccent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) async {
          if (index != 2) {
            setState(() {
              this.index = index;
              this.shouldOpen = false;
            });
          } else {
            setState(() => this.shouldOpen = !this.shouldOpen);
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              title: Text(
                'home',
                style: TextStyle(fontSize: 14),
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text(
              'contact managment',
              style: TextStyle(fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_photo_alternate),
            title: Text(
              'add photo',
              style: TextStyle(fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward),
              title: Text(
                'contact teachers',
                style: TextStyle(fontSize: 14),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text(
                'school news',
                style: TextStyle(fontSize: 14),
              )),
        ],
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
      ),
      //Adding SpinCircleBottomBarHolder to body of Scaffold
      body: Stack(fit: StackFit.expand, children: [
        Center(
            child: Text(
          'Awsome Wheel',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        )),
        Positioned(
          bottom: -150,
          right: 0,
          left: 0,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: shouldOpen
                ? Container(
                    width: 300,
                    height: 300,
                    child: Stack(
                      children: <Widget>[
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: -3.14, end: 0),
                          curve: Curves.easeInOutQuad,
                          duration: Duration(milliseconds: 500),
                          builder: (BuildContext context,
                              double value, Widget child) {
                            return Transform.rotate(
                              angle: value,
                              child: child,
                              alignment: Alignment.bottomCenter,
                            );
                          },
                          child: EmptyLayer(
                            radius: 300,
                            color: Colors.red,
                          ),
                        ),
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: -3.14, end: 0),
                          curve: Curves.easeInOutQuad,
                          duration: Duration(milliseconds: 600),
                          builder: (BuildContext context,
                              double value, Widget child) {
                            return Transform.rotate(
                              angle: value,
                              child: child,
                              alignment: Alignment.bottomCenter,
                            );
                          },
                          child: EmptyLayer(
                            radius: 300,
                            color: Colors.green,
                          ),
                        ),
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: -3.14, end: 0),
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInOutQuad,
                          builder: (BuildContext context,
                              double value, Widget child) {
                            return Transform.rotate(
                              angle: value,
                              child: child,
                              alignment: Alignment.bottomCenter,
                            );
                          },
                          child: PrimaryCircle(
                            circleItems: [
                              Icon(
                                Icons.add_shopping_cart,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.add_to_home_screen,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.access_alarm,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.language,
                                color: Colors.black,
                              )
                            ],
                            radius: 300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ))
                : SizedBox(),
          ),
        )
      ]),
    );
  }
}

// This is the Painter class
class PrimaryCircle extends StatelessWidget {
  final List<Widget> circleItems;
  final Color color;
  final double radius;

  const PrimaryCircle(
      {Key key,
      @required this.color,
      @required this.radius,
      @required this.circleItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radianGap = 3.14159 / circleItems.length;
    double start = radianGap / 2;
    return ClipRect(
      child: Align(
        heightFactor: 0.5,
        alignment: Alignment.topCenter,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: [
                  Stack(
                    fit: StackFit.expand,
                    children:
                        circleItems.asMap().entries.map((entry) {
                      Widget value = entry.value;
                      return Transform.translate(
                          offset: Offset.fromDirection(
                              -(start + (entry.key * radianGap)),
                              radius / 3),
                          child: value);
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 150,
                    left: 0,
                    right: 0,
                    child: EmptyLayer(
                      color: Colors.blueAccent,
                      radius: 120,
                      child: Text(
                        'choose',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class EmptyLayer extends StatelessWidget {
  final Color color;
  final double radius;
  Widget child;

  EmptyLayer({Key key, this.color, this.radius, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        heightFactor: 0.5,
        alignment: Alignment.topCenter,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: child,
          )),
        ),
      ),
    );
  }
}
