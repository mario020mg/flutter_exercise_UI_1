import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stack/app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 15,
            unselectedFontSize: 15,
            selectedLabelStyle: TextStyle(fontFamily: 'Cairo'),
            unselectedLabelStyle: TextStyle(fontFamily: 'Cairo'),
            selectedItemColor: kActiveIconColor,
            currentIndex: 1,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/calendar.svg'),
                  label: 'Today'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/gym.svg'),
                  label: 'All Exercises'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/Settings.svg'),
                  label: 'Settings'),
            ]),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Color(0xFFf4ceb7),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage('assets/images/undraw_pilates_gpdb.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SafeArea(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFf1bea1),
                                  shape: BoxShape.circle),
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.stacked_line_chart_sharp,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Wrap(children: [
                            Text(
                              'Good Morning Shishir',
                              style: TextStyle(
                                  height: 1,
                                  fontFamily: 'Cairo',
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor),
                            ),
                          ]),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kBackground,
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                Icons.search,
                                size: 30,
                              )),
                          Expanded(
                              child: TextField(
                            decoration:
                                InputDecoration.collapsed(hintText: 'Search'),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8),
                                  child: ExerciseCard(
                                    path: 'assets/icons/Hamburger.svg',
                                    title: 'Diet Recommendation',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8),
                                  child: ExerciseCard(
                                    path: 'assets/icons/Excrecises.svg',
                                    title: 'Kegel Exercises',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 8),
                                      child: ExerciseCard(
                                        path: 'assets/icons/Meditation.svg',
                                        title: 'Meditation',
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 8),
                                      child: ExerciseCard(
                                        path: 'assets/icons/yoga.svg',
                                        title: 'Yoga',
                                      )))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ));
  }
}

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({Key? key, required this.title, required this.path})
      : super(key: key);
  final String path;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black,
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: SvgPicture.asset(
                  path,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 2,
                child: Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: kTextColor),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
