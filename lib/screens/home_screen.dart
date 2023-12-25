import 'package:flutter/material.dart';
import 'package:learn/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(
          backgroundColor: Colors.black,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF131619),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              children: [
                Container(
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
                const ListTile(
                  title: Text(
                    'Item 2',
                    style: TextStyle(color: Colors.white),
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
                      Icons.login_outlined,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
              ],
            ),
          )),
      body: SafeArea(
          child: Container(
        // child: FormBuilder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: GestureDetector(
                      onTap: _openDrawer,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  const Text(
                    'Welcom to Mina!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.auto_fix_high_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ]),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: const BouncingScrollPhysics(),
                children: const [
                  Text('data'),
                ],
              ),
            ),
            TextField(
              style: const TextStyle(
                color: Color(0xFFFAFAFA),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_circle_up_outlined,
                    color: Color(0xFF1E8F8E),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Color(0xFF3D3737)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF1E8F8E),
                    width: 2.0,
                  ),
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                hintText: 'Message chat...',
              ),
            ),
          ],
          // )
        ),
      )),
    );
  }
}
