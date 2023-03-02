import 'package:flutter/material.dart';
import '../Data/courses_json.dart';
import '../courses/Network.dart';
import '../courses/SoftwareEngineering.dart';
import '../courses/Weather.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text (
                'Current Courses',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "See More",
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Column(
            children: mycourses
                .where((data) => data['percentage'] == 100)
                .map((data) {
              var size = MediaQuery.of(context).size;
              return Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 66, 92),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: size.width * .17,
                              width: size.width * .17,
                              child: ClipRect(
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    data['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Instructor : ${data['instructor_name']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  width: size.width,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Visibility(
                                  visible: data['percentage'] == 100,
                                  child: Container(
                                    width: data['percentage'] * 4.2,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.amber.withOpacity(0.5),
                                          blurRadius: 6.0,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 50,
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${data['percentage']}%',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

    
  

 
 // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Courses'),
  //       ),
  //       body: ListView(
  //         children: [
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           Container(
  //             width: 300,
  //             height: 325,
  //             decoration: BoxDecoration(
  //                 border: Border.all(width: 1, color: Colors.blue),
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(20)),
  //             child: Column(children: [
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(15.0),
  //                 child: Image.asset(
  //                   'images/9.jpg',
  //                   fit: BoxFit.cover,
  //                   width: 300,
  //                   height: 200,
  //                   // alignment: Alignment.topCenter,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               const Text('Flutter course',
  //                   style:
  //                       TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
  //               const Text('Learning managment',
  //                   style: TextStyle(fontSize: 17)),
  //             ]),
  //           ),
  //           SizedBox(
  //             height: 150,
  //             child: ListView(
  //               scrollDirection: Axis.horizontal,
  //               children: [
  //                 GestureDetector(
  //                     onTap: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => const Network(),
  //                         ),
  //                       );
  //                     },
  //                     child: Container(
  //                         margin: const EdgeInsets.all(15),
  //                         decoration: BoxDecoration(
  //                             color: const Color.fromARGB(255, 39, 100, 161),
  //                             borderRadius: BorderRadius.circular(8)),
  //                         width: 200,
  //                         height: 300,
  //                         alignment: Alignment.center,
  //                         child: ElevatedButton(
  //                           child: const Text('Network'),
  //                           onPressed: () {
  //                             Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                     builder: (context) => const Network()));
  //                           },
  //                         ))),
  //                 GestureDetector(
  //                     onTap: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => const SoftwareEngineering(),
  //                         ),
  //                       );
  //                     },
  //                     child: Container(
  //                         decoration: BoxDecoration(
  //                             color: Colors.purple,
  //                             borderRadius: BorderRadius.circular(8)),
  //                         margin: const EdgeInsets.all(15),
  //                         width: 200,
  //                         height: 300,
  //                         //color:
  //                         alignment: Alignment.center,
  //                         child: ElevatedButton(
  //                           child: const Text('Software Engieering'),
  //                           onPressed: () {
  //                             Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                     builder: (context) =>
  //                                         const SoftwareEngineering()));
  //                           },
  //                         ))),
  //                 Container(
  //                     decoration: BoxDecoration(
  //                         color: Colors.purple,
  //                         borderRadius: BorderRadius.circular(8)),
  //                     margin: const EdgeInsets.all(15),
  //                     width: 200,
  //                     height: 300,
  //                     //color:
  //                     alignment: Alignment.center,
  //                     child: const Text(
  //                       'Cyber Security',
  //                       style: TextStyle(fontSize: 17),
  //                     )),
  //                 GestureDetector(
  //                     onTap: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => WeatherPage(),
  //                         ),
  //                       );
  //                     },
  //                     child: Container(
  //                         margin: const EdgeInsets.all(15),
  //                         decoration: BoxDecoration(
  //                             color: const Color.fromARGB(255, 39, 100, 161),
  //                             borderRadius: BorderRadius.circular(8)),
  //                         width: 200,
  //                         height: 300,
  //                         alignment: Alignment.center,
  //                         child: ElevatedButton(
  //                           child: const Text('AI'),
  //                           onPressed: () {
  //                             Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                     builder: (context) => WeatherPage()));
  //                           },
  //                         ))),
  //                 // Container(
  //                 //     decoration: BoxDecoration(
  //                 //         color: Colors.purple,
  //                 //         borderRadius: BorderRadius.circular(8)),
  //                 //     margin: const EdgeInsets.all(15),
  //                 //     width: 200,
  //                 //     height: 300,
  //                 //     //color:
  //                 //     alignment: Alignment.center,
  //                 //     child: const Text(
  //                 //       'AI Engineering',
  //                 //       style: TextStyle(fontSize: 17),
  //                 //     ),
  //                 //     ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ));
