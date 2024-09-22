import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nots_app/fetchNotes_cubit/fetch_notes_cubit.dart';
import '../Widgets/note_bottom_sheet.dart';
import '../Widgets/nots_view_body.dart';

class Nots_View extends StatefulWidget {
  const Nots_View({super.key});

  @override
  State<Nots_View> createState() => _Nots_ViewState();
}

class _Nots_ViewState extends State<Nots_View> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<fetchNotesCubit>(context).fetchNotes();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: const  nots_view_body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      showModalBottomSheet(
        isScrollControlled: true,
          context: context, builder:(context) {
        return const note_bottom_sheet();
      });
      },
        child: const  Icon(Icons.add),
    ),
    );
  }
}



