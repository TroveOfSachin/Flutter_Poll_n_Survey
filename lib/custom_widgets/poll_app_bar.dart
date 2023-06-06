import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PollAppBar extends StatefulWidget {
  const PollAppBar({super.key});

  @override
  State<PollAppBar> createState() => _PollAppBarState();
}

class _PollAppBarState extends State<PollAppBar> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [Icon(Icons.how_to_vote_outlined), Text("App Title")],
    );
  }
}
