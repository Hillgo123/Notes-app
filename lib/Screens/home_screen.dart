import 'dart:developer';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Models/note_operation.dart';
import 'package:note_app/Screens/add_screen.dart';
import 'package:note_app/Screens/edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  final title_style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  final description_style = const TextStyle(fontSize: 17);
  String title_text = "";
  String description_text = "";

  List<note> _notes = [];
  List<note> edit_notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7f53e0),
      floatingActionButton: FloatingActionButton (
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => add_screen()));
        },
        backgroundColor: Colors.white,
        tooltip: "New Note",
        heroTag: null,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Color(0xFF7f53e0),
        ),
      ),
      appBar: AppBar(
        title: const Text("My Notes"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<note_operation>(
        builder: (context, note_operation data, child) {
          return ListView.builder(
            itemCount: data.get_notes.length,
            itemBuilder: (context, index) {
              final Note = data.get_notes[index];
              return Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    Note.title,
                    style: title_style,
                  ),
                  Text(
                    Note.description,
                    style: description_style,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      FloatingActionButton(
                        onPressed: () {
                          Provider.of<note_operation>(context, listen: false).edit_note(Note.title, Note.description);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => edit_screen()));
                          Provider.of<note_operation>(context, listen: false).delete_note(Note);
                        },
                        hoverElevation: 0,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        tooltip: "Edit Note",
                        heroTag: null,
                        child: const Icon(
                          Icons.edit,
                          size: 20,
                          color: Color(0xFF7f53e0),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Provider.of<note_operation>(context, listen: false).delete_note(Note);
                        },
                        hoverElevation: 0,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        tooltip: "Delete Note",
                        heroTag: null,
                        
                        child: const Icon(
                          Icons.delete,
                          size: 20,
                          color: Color(0xFF7f53e0),
                        ),
                      ),
                    ],
                  ),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }
}