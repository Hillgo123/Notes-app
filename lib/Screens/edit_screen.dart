import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Models/note_operation.dart';
import 'package:note_app/Screens/add_screen.dart';
import 'package:note_app/Screens/edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class edit_screen extends StatelessWidget{
  String title_text = "";
  String description_text = "";

  List<note> edit_notes = [];


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7f53e0),
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<note_operation>(
        builder: (context, note_operation data, child){
          return ListView.builder(
            itemCount: data.get_notes.length,
            itemBuilder: (context, index) {
            final Note = data.getedit_notes[index];
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                    ),
                    initialValue: Note.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      title_text = value;
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: description_text,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        description_text = value;
                      },
                  ),
                  ),

                  TextButton(onPressed: () {
                    Provider.of<note_operation>(context, listen: false).add_new_note(title_text, description_text);
                    Navigator.pop(context);
                  }, 
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    "Confirm Edit",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7f53e0)
                    ),
                  ),
                  )
                ],
              ),
            );
          }
          );
        }
      ),
    );
  }
}