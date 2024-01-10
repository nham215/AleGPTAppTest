import 'package:flutter/material.dart';
import 'package:learn/model/message.dart';
import 'package:learn/screens/layout/drawer.dart';
import 'package:learn/screens/layout/input_message.dart';
import 'package:learn/screens/layout/message.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  final String name;
  const HomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  List<MessageModel> listMessage = [
    MessageModel(
        chatId: 1,
        content: 'User Come up with 5 concepts for a retro-style arcade game',
        senderType: 'user'),
    MessageModel(
        chatId: 1,
        content:
            'Galactic Groove Defender: Navigate a spaceship through a neon-infused galaxy, defending against waves of pixelated alien invaders with funky, retro-inspired music influencing the gameplay.',
        senderType: 'bot'),
    MessageModel(
        chatId: 1,
        content: 'User Come up with 5 concepts for a retro-style arcade game',
        senderType: 'user'),
    MessageModel(
        chatId: 1,
        content:
            'Pixel Prowler Puzzle Quest: Embark on a puzzle-solving adventure in a cyberpunk cityscape, where players must navigate through mazes, avoiding enemies and unlocking secret pathways using classic block-pushing mechanics.',
        senderType: 'bot'),
    MessageModel(
        chatId: 1,
        content: 'User Come up with 5 concepts for a retro-style arcade game',
        senderType: 'user'),
    MessageModel(
        chatId: 1,
        content:
            'Time-Warp Warriors: Travel through different eras, battling foes in a side-scrolling beat \'em up. Fight dinosaurs in prehistoric times, encounter robots in a futuristic city, and duel with knights in medieval landscapes, all with a nostalgic pixelated aesthetic.',
        senderType: 'bot'),
    MessageModel(
        chatId: 1,
        content: 'User Come up with 5 concepts for a retro-style arcade game',
        senderType: 'user'),
    MessageModel(chatId: 1, content: 'Hi there!', senderType: 'bot'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomSheet: const InputMessage(),
      drawer: Drawer(
        // backgroundColor: Theme.of(context).colorScheme.background,
        child: DrawerUI(name: widget.name),
      ),
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
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 24,
                      ),
                    ),
                  ),
                  Text(
                    'Welcom to Mina!',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.auto_fix_high_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 24,
                  ),
                ]),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 40),
                scrollDirection: Axis.vertical,
                child: Column(
                  children:
                      listMessage.map((e) => Message(message: e)).toList(),
                ),
              ),
            ),
          ],
          // )
        ),
      )),
    );
  }
}
