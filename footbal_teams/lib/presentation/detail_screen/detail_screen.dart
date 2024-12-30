import 'package:flutter/material.dart';

import '../../domain/models/teams_model.dart';

class DetailScreen extends StatefulWidget {
  final Teams data;
  const DetailScreen({super.key, required this.data});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        spacing: 15,
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ],
          ),
          Row(
            children: [
              Text("Name:  "),
              Text('${widget.data.name}'),
            ],
          ),
          Row(
            children: [
              Text("Flag:  "),
              SizedBox(
                  height: 60,
                  child: Image.network(
                    widget.data.flag.toString(),
                  ))
            ],
          ),
          Row(
            children: [
              Text("Fifa Code:  "),
              Text('${widget.data.fifaCode}'),
            ],
          ),
          Row(
            children: [
              Text("Iso:  "),
              Text('${widget.data.iso2}'),
            ],
          ),
          Row(
            children: [
              Text("Emoji:  "),
              Text('${widget.data.emoji}'),
            ],
          ),
          Row(
            children: [
              Text("Emoji String:  "),
              Text('${widget.data.emojiString}'),
            ],
          )
        ],
      )),
    );
  }
}
