import 'package:flutter/material.dart';
import 'package:learn/screens/login_screen.dart';

class DrawerUI extends StatelessWidget {
  const DrawerUI({super.key});

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
                  child: const ListTile(
                    title: Text(
                      'Trong Nham',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    leading: CircleAvatar(
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
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
