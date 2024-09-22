import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import '../Models/Nots_Model.dart';
import 'fetch_notes_state.dart';

class fetchNotesCubit extends Cubit<fetchNotesState>{
  fetchNotesCubit() : super(initialfetch());
List<Note_Model>? data ;
  fetchNotes ()
   {
      var  noteBox =  Hive.box('Notes_box');
      data =  noteBox.values.cast<Note_Model>().toList();
     emit(successfetch());
    }

}