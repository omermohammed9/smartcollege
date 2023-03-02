import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class UserInformation {
//   //Declare a variable to store the name of the user
//   late String name;
//   //Declare a variable to store the profile picture of the user
//   late String profilePicture;
//   //Declare a variable to store the email of the user
//   late String email;
//   //Declare a variable to store the phone number of the user
//   late String phoneNumber;

//   //Create a constructor for the UserInformation class
//   UserInformation(
//       {required this.name,
//       required this.profilePicture,
//       required this.email,
//       required this.phoneNumber});
// }

//Version no.1
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(''),
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset(
                      'images/user_profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Omer .M A.'),
                          Text('Software Eng.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: const [
                          Text(
                            '15',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Credits',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: const [
                          Text(
                            '15',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Courses',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: const [
                          Text(
                            '7th',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Semester',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Account'),
                      const SizedBox(height: 20),
                      rowChild(Icons.person_outlined, "Personal Info"),
                      rowChild(Icons.list_alt_outlined, "Achievements"),
                      rowChild(Icons.history, "Activities"),
                      rowChild(Icons.bar_chart_outlined, "Progress"),
                    ]),
              ),
              //Notifications
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Notifications'),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(children: [
                        Icon(Icons.notifications_on_outlined),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Pop-Up Notifications'),
                        )),
                        Container(
                            child: CupertinoSwitch(
                                value: switchValue,
                                activeColor: Colors.purple,
                                onChanged: (bool value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                })),
                      ]),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Other'),
                      const SizedBox(height: 20),
                      rowChild(Icons.mail_outline, "Contact Us"),
                      rowChild(Icons.privacy_tip_outlined, "Privacy Policy"),
                      rowChild(Icons.settings_outlined, "Settings"),
                    ]),
              ),
            ],
          )),
    );
  }
}

Widget rowChild(icon, text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Row(children: [
      Icon(
        icon,
      ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text(text),
      )),
      Icon(
        Icons.chevron_right,
        color: Colors.grey,
      )
    ]),
  );
}












//Version 4
// class _ProfileScreenState extends State<ProfileScreen> {
//   UserInformation userInformation = UserInformation(
//     name: '',
//     profilePicture:
//         'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//     email: '',
//     phoneNumber: '',
//   );

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             // 1. Create a container with a height of 200 pixels and width of the entire screen
//             Container(
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   // 2. Use the profile picture URL to load the image
//                   image: NetworkImage(userInformation.profilePicture),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   // This is the first text field.
//                   // It takes the user's name as input.
//                   TextFormField(
//                     // Set the initial value of the text field.
//                     initialValue: userInformation.name,
//                     // Display this label above the text field.
//                     decoration: InputDecoration(labelText: 'Name'),
//                     // Define the type of input validation to perform.
//                     validator: (value) {
//                       // If the user has not entered anything,
//                       // do not allow them to submit the form.
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a name';
//                       }
//                       return null;
//                     },
//                     // Save the user's input, so that it can be retrieved later.
//                     onSaved: (value) {
//                       if (value != null) {
//                         userInformation.name = value;
//                       }
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     // Set the initial value to the user's email
//                     initialValue: userInformation.email,
//                     // Add a label, so the user knows what they're supposed to enter
//                     decoration: InputDecoration(labelText: 'Email'),
//                     // Set the type of keyboard that should show up
//                     keyboardType: TextInputType.emailAddress,
//                     // Validate the input
//                     validator: (value) {
//                       if (value != null && value.isEmpty) {
//                         return 'Please enter an email';
//                       }
//                       if (value != null && !value.contains('@')) {
//                         return 'Please enter a valid email address';
//                       }
//                       return null;
//                     },
//                     // Save the value entered
//                     onSaved: (value) => userInformation.email = value ?? '',
//                   ),
//                   TextFormField(
//                     initialValue: userInformation.phoneNumber,
//                     decoration: InputDecoration(labelText: 'Phone number'),
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a phone number';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) =>
//                         userInformation.phoneNumber = value ?? '',
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() == true) {
//                         _formKey.currentState?.save();
//                         setState(() {
//                           userInformation = UserInformation(
//                             name: userInformation.name,
//                             profilePicture: userInformation.profilePicture,
//                             email: userInformation.email,
//                             phoneNumber: userInformation.phoneNumber,
//                           );
//                         });
//                       }
//                     },
//                     child: Text('Save'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Version no.3
// class _ProfileScreenState extends State<ProfileScreen> {
//   UserInformation userInformation = UserInformation(
//     name: 'John Doe',
//     profilePicture:
//         'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//     email: 'johndoe@example.com',
//     phoneNumber: '123-456-7890',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(userInformation.profilePicture),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       userInformation.name,
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Email: ${userInformation.email}',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Phone: ${userInformation.phoneNumber}',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//Version no.2

// class _ProfileScreenState extends State<ProfileScreen> {
//   UserInformation userInformation = UserInformation(
//     name: 'John Doe',
//     profilePicture:
//         'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//     email: 'johndoe@example.com',
//     phoneNumber: '123-456-7890',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(userInformation.profilePicture),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Text(
//                   userInformation.name,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Text(userInformation.email),
//                 SizedBox(height: 16),
//                 Text(userInformation.phoneNumber),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
