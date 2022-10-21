import 'dart:developer';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Screens/home_screen.dart';
import 'package:note_app/Screens/add_screen.dart';
import 'package:note_app/Screens/edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class note_operation extends ChangeNotifier{
  List<note> _notes = [];
  var index;

  

  List<note> get get_notes {
    return _notes;
  }

  List<note> edit_notes = [];
  

  List<note> get getedit_notes {
    return edit_notes;
  }

  void add_new_note(String title, String description){
    note Note = note(title, description);
    _notes.add(Note);
    notifyListeners();
  }

  void delete_note(index){
    _notes.remove(index);
    notifyListeners();
  }

  void delete_edited_note(index){
    edit_notes.remove(index);
    notifyListeners();
  }

  void edit_note(String title, String description) {
    note Note = note(title, description);
    edit_notes.add(Note);
    notifyListeners(
    );
  }

}