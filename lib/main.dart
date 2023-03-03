import 'package:flutter/material.dart';
import 'package:smartcollege/Auth/signin.dart';
import 'package:smartcollege/nav-main.dart';
import 'package:smartcollege/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart College',
        home: SignInScreen());
  }
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: StreamBuilder(
//             stream: FirebaseDatabase.instance.ref().child("message").onValue,
//             builder: (context, snap) {
//               if (snap.hasData &&
//                   !snap.hasError &&
//                   snap.data?.snapshot.value != null) {
//                 return Text(snap.data!.snapshot.value.toString());
//               } else {
//                 return Text("Loading");
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



