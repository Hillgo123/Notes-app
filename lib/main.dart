import 'dart:developer';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Models/note_operation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:note_app/screens/home_screen.dart';
import 'package:note_app/screens/add_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<note_operation>(
      create: (context) => note_operation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: home_screen(),
      )
    );
  }
}