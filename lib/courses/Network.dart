import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

var txt = const Text('');
bool _showText = false;

class Network extends StatefulWidget {
  const Network({super.key});
  @override
  State<Network> createState() => _Myappstate();
}

class _Myappstate extends State<Network> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Center(
          child: Column(
            children: [
              txt,
              IconButton(
                icon: const Icon(Icons.web),
                onPressed: () async {
                  final url = Uri.parse('https://www.google.com');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
        ));
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 20, 10, 9),
    centerTitle: true, //false OR True
    title: const Text(
      'Networking',
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.right,
    ),
    actions: [
      Row(
        children: [
          Container(
            child: IconButton(
                icon: const Icon(Icons.info_rounded),
                onPressed: () {
                  txt = const Text('Omar');
                  // setState(() {
                  //   _showText = !_showText;
                  // }
                  // );
                }),
          ),
          Container(
              child: IconButton(
                  icon: const Icon(Icons.abc_sharp), onPressed: () {})),
        ],
      ),
    ],
  );
}

void setState(Null Function() param0) {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 20, 10, 9),
//           centerTitle: true, //false OR True
//           title: const Text(
//             'Networking',
//             style: TextStyle(
//                 fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.right,
//           ),
//           actions: [
//             Row(
//               children: [
//                 Container(
//                   child: IconButton(
//                       icon: const Icon(Icons.info_rounded),
//                       onPressed: () {
//                         txt = const Text('Omar');
//                         setState(() {
//                           _showText = !_showText;
//                         });
//                       }),
//                 ),
//                 Container(
//                     child: IconButton(
//                         icon: const Icon(Icons.abc_sharp), onPressed: () {})),
//               ],
//             ),
//           ],
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               txt,
//               IconButton(
//                 icon: const Icon(Icons.web),
//                 onPressed: () async {
//                   final url = Uri.parse('https://www.google.com');
//                   if (await canLaunchUrl(url)) {
//                     await launchUrl(url);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }




   // IconButton(
              //   icon: const Icon(Icons.picture_as_pdf),
              //   onPressed: () async {
              //     final url = Uri.parse('https://www.example.com');
              //     if (await canLaunchUrl(url)) {
              //       await launchUrl(url);
              //     } else {
              //       throw 'Could not launch $url';
              //     }
              //   },
              // )