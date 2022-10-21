import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Models/note_operation.dart';
import 'package:note_app/Screens/add_screen.dart';
import 'package:note_app/Screens/edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';



class edit_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7f53e0),
      appBar: AppBar(
        title: const Text('Edit Notes'),
        centerTitle: true,
        elevation: 0,
      ),

      body: Consumer<note_operation>(
        builder: (context, note_operation data, child) {
          return ListView.builder(
            itemCount: data.getedit_notes.length,
            itemBuilder: (context, index) {
              return edit_card(data.getedit_notes[index]);
            },
          );
        },
      ),
    );
  }
}

class edit_card extends StatelessWidget {
  final note Note;

  edit_card(this.Note);
  
  String title_text = '';
  String description_text = '';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            initialValue: Note.title, 
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            onChanged: (value) {            
              title_text = value;
            },
            maxLines: null,
          ),
          TextFormField(
            initialValue: Note.description, 
            style: const TextStyle(fontSize: 17),
            decoration: const InputDecoration(
            border: InputBorder.none,
            ),
            onChanged: (value) {
              description_text = value;
            },
            maxLines: null,
          ),
          TextButton(onPressed: () {
            if (title_text != '' && description_text != '') {
              Provider.of<note_operation>(context, listen: false).add_new_note(title_text, description_text);
            }else if(description_text != '') {
              Provider.of<note_operation>(context, listen: false).add_new_note(Note.title, description_text);
            }else if(title_text != '') {
              Provider.of<note_operation>(context, listen: false).add_new_note(title_text, Note.description);
            }else{
              Provider.of<note_operation>(context, listen: false).add_new_note(Note.title, Note.description);
            }
            Navigator.pop(context);
            Provider.of<note_operation>(context, listen: false).delete_edited_note(Note);
          }, 
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            alignment: Alignment.bottomRight,
          ),
          child: const Text(
            'Confirm Edit',
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: Color(0xFF7f53e0)
            ),
          ),
          ),
        ],
      ),
    );
  }
}