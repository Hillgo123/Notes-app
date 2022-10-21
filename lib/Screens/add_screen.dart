import 'dart:developer';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Models/note_operation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:note_app/screens/home_screen.dart';



class add_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title_text = "";
    String description_text = "";

    return Scaffold(
      backgroundColor: const Color(0xFF7f53e0),
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField (
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Title",
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onChanged: (value) {
                title_text = value;
              },
              maxLines: null,
            ),
            Expanded(
              child: TextField (
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Enter Description",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  description_text = value;
                },
                maxLines: null,
              ),
            ),
            
            TextButton(
              onPressed: () {
                Provider.of<note_operation>(context, listen: false).add_new_note(title_text, description_text);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                "Add Note", 
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7f53e0)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}