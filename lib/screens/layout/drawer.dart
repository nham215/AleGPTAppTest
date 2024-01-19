import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn/model/chat.dart';
import 'package:learn/providers/chat_provider.dart';
import 'package:learn/theme/theme.dart';
import 'package:learn/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrawerUI extends StatefulWidget {
  final String name;
  final List<Chat> listChat;
  const DrawerUI({
    Key? key,
    required this.name,
    required this.listChat,
  }) : super(key: key);

  @override
  State<DrawerUI> createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
  @override
  Widget build(BuildContext context) {
    int chatId = Provider.of<ChatProvider>(context, listen: false).chatId;
    bool isMode =
        Provider.of<ThemeProvider>(context, listen: false).themeData ==
            darkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              ListTile(
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  onTap: () {
                    CollectionReference collRef =
                        FirebaseFirestore.instance.collection('chat');
                    // collRef.add({
                    //   'Name': 'New chatqwqw',
                    //   'userId': 112,
                    // });
                    Provider.of<ChatProvider>(context, listen: false)
                        .setChatId(0);
                    Navigator.pop(context);
                  },
                  title: Text(
                    'New chat',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  leading: const Icon(Icons.add),
                ),
              ),
              // StreamBuilder<QuerySnapshot>(
              //     stream: FirebaseFirestore.instance.collection('chat').snapshots(),
              //     builder: builder),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: widget.listChat.map((e) {
                      return Container(
                        decoration: BoxDecoration(
                          color: chatId == e.id
                              ? Theme.of(context).colorScheme.onBackground
                              : null,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            Provider.of<ChatProvider>(context, listen: false)
                                .setChatId(e.id!);
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
                ),
              ),
              Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: Text(
                      'Log out',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.onBackground,
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
                                if (isMode) {
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .onLightMode();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: !isMode
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                      : null,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.light_mode_outlined,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (!isMode) {
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .onDarkMode();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isMode
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                      : null,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.dark_mode_outlined,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
        ),
      ),
    );
  }
}
