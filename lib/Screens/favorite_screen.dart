import 'dart:developer';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Models/note_operation.dart';
import 'package:note_app/Screens/add_screen.dart';
import 'package:note_app/Screens/edit_screen.dart';
import 'package:note_app/Screens/favorite_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class favorite_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7f53e0),
      appBar: AppBar(
        title: const Text("Favorite Notes"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Consumer<note_operation>(
        builder: (context, note_operation data, child) {
          return ListView.builder(
            itemCount: data.getfavorite_notes.length,
            itemBuilder: (context, index) {
              return favorite_notes_card(data.getfavorite_notes[index]);
            },
          );
        },
      ),
    );
  }
}

class favorite_notes_card extends StatelessWidget {
  final note Note;

  favorite_notes_card(this.Note);
  
  String title_text = "";
  String description_text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: Note.title, 
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            onChanged: (value) {
            title_text = value;
          },
            ),
          TextFormField(initialValue: Note.description, 
          style: const TextStyle(fontSize: 17),
          onChanged: (value) {
            description_text = value;
          },
          )
        ],
      ),
    );
  }
}