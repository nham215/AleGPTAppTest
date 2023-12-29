import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerUI extends StatefulWidget {
  final String name;
  const DrawerUI({Key? key, required this.name}) : super(key: key);

  @override
  State<DrawerUI> createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF131619),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    title: Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.logo_dev_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF202123),
                    borderRadius: BorderRadius.circular(
                        8.0), // Điều chỉnh giá trị để có góc cong mong muốn
                  ),
                  child: const ListTile(
                    title: Text(
                      'Flutter Navigation to Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'PCN Type Formatting',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'React Span Handling',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                title: const Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                ),
                onTap: () async {
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  // await Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
              ),
              const Row(
                children: [
                  Text(
                    'Mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
