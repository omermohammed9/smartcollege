import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Login to Your app',
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 44.0),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.black,
                )),
          ),
          SizedBox(
            height: 26.0,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            "Don't Remember Your Password",
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(
            height: 88.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Color(0xFF0069FE),
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _LoginPageState extends State<LoginPage> {
//   final _auth = FirebaseAuth.instance;
//   String email = '';
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(hintText: 'Email'),
//               onChanged: (value) => email = value,
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               decoration: InputDecoration(hintText: 'Password'),
//               onChanged: (value) => password = value,
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               child: Text('Login'),
//               onPressed: () async {
//                 try {
//                   final user = await _auth.signInWithEmailAndPassword(
//                       email: email, password: password);
//                   if (user != null) {
//                     Navigator.pushReplacementNamed(context, '/home');
//                   }
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Logout'),
//           onPressed: () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushReplacementNamed(context, '/login');
//           },
//         ),
//       ),
//     );
//   }
// }
