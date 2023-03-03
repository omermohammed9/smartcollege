import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
                        children: const[
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
                      padding: const EdgeInsets.all(10),
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
                      padding: const EdgeInsets.all(10),
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
                      padding: const EdgeInsets.all(10),
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
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                        const Icon(Icons.notifications_on_outlined),
                       const Expanded(
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
          )
          ),
    );
  }
}

Widget rowChild(icon, text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(children: [
      Icon(
        icon,
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(text),
      )),
     const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      )
    ]
    ),
  );
}
