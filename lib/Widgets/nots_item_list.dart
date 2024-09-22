import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nots_app/fetchNotes_cubit/fetch_notes_cubit.dart';
import 'package:nots_app/fetchNotes_cubit/fetch_notes_state.dart';

import 'nots_item.dart';

class nots_item_list extends StatelessWidget {
  const nots_item_list({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<fetchNotesCubit,fetchNotesState>(
      builder: ( context, state){
      List notes =  BlocProvider.of<fetchNotesCubit>(context).data?? [];
     return  Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) =>  nots_item(note: notes[index],),
          itemCount:notes.length,
        ),
      );
      }
    );
  }
}
