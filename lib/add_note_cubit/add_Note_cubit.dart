

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/Models/Nots_Model.dart';

import 'add_Note_state.dart';


class addNoteCubit extends Cubit<addNoteState>{
  addNoteCubit():super(initialState());
Color? color ;
addNote (Note_Model note)
async {
  note.color = color!.value;
  emit(loadingState());
try {
  var noteBox =  Hive.box('Notes_box');
  await noteBox.add(note);
  emit(successState());

} catch (e) {
  emit(failureState(e.toString()));
  }
 }
}