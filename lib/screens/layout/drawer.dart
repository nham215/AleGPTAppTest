import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn/model/chat.dart';
import 'package:learn/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class DrawerUI extends StatefulWidget {
  final String name;
  final List<Chat> listChat;
  final Function(int chatId) setChatId;
  const DrawerUI(
      {Key? key,
      required this.name,
      required this.listChat,
      required this.setChatId})
      : super(key: key);

  @override
  State<DrawerUI> createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
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
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(
                        Icons.android,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: widget.listChat.map((e) {
                    return Container(
                      decoration: BoxDecoration(
                        color: id == e.id
                            ? Theme.of(context).colorScheme.onBackground
                            : null,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            id = e.id!;
                          });
                          widget.setChatId(e.id!);
                          Navigator.pop(context);
                        },
                        title: Text(
                          e.name!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                title: Text(
                  'Log out',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  child: Icon(
                    Icons.logout_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () async {
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  // await Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Switch mode: ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .onLightMode();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.light_mode_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .onDarkMode();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.dark_mode_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
