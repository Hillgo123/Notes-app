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
    return _notes;
  }

  List<note> favorite_notes = [];
    

  List<note> get getfavorite_notes {
    return favorite_notes;
  }

  void add_new_note(String title, String description){
    note Note = note(title, description);
    _notes.add(Note);
    notifyListeners();
  }

  void add_to_favorites(String title, String description){
    note Note = note(title, description);
    favorite_notes.add(Notöe);
    notifyListeners();
  }

  void delete_note(index){
    _notes.remove(index);
    notifyListeners();
  }

  void edit_note(index) {
    // note Note = note(title, description);
    edit_notes.add(index);
    notifyListeners();
  }
}