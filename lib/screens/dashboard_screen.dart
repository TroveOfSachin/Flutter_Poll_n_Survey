import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.how_to_vote_outlined),
            Expanded(child: Center(child: Text("Title"))),
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text("Action 1")),
                PopupMenuItem(child: Text("Action 1")),
                PopupMenuItem(child: Text("Action 1")),
                PopupMenuItem(child: Text("Action 1")),
              ];
            },
            onSelected: (value) {},
          )
        ],

        backgroundColor: Colors.deepPurpleAccent, //<-- SEE HERE
      ),
      body: const Center(child: Text("Welcome")),
    );
  }
}
