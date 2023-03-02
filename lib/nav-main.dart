import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartcollege/screens/courses.dart';
import 'package:smartcollege/screens/home.dart';
import 'package:smartcollege/screens/profile.dart';

class Nav_Main extends StatefulWidget {
  @override
  _Nav_mainState createState() => _Nav_mainState();
}

class _Nav_mainState extends State<Nav_Main> {
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getScreen() {
    List<Widget> screen = [HomeScreen(), ProfileScreen(), CoursesScreen()];
    return IndexedStack(index: screenIndex, children: screen);
  }

  Widget getFooter() {
    List<String> bottomitems = [
      'images/home_icon.svg',
      'images/user_icon.svg',
      'images/play_icon.svg'
    ];
    return Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black45, blurRadius: 30.0, offset: Offset(0, -10))
          ],
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
                padding: const EdgeInsets.all(21),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(bottomitems.length, (index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            screenIndex = index;
                          });
                        },
                        child: Column(children: [
                          SvgPicture.asset(bottomitems[index],
                              height: 17.5,
                              color: (screenIndex == index)
                                  ? Colors.red
                                  : Colors.black),
                          const SizedBox(height: 5.0),
                        ]));
                  }),
                ))));
  }
}
