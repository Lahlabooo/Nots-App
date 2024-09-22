import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/Models/Nots_Model.dart';

import '../add_note_cubit/add_Note_cubit.dart';
import '../add_note_cubit/add_Note_state.dart';
import '../fetchNotes_cubit/fetch_notes_cubit.dart';
import 'Custom_Button.dart';
import 'Custom_Text_Field.dart';
import 'colorItemList.dart';

class Form_Bottom_sheet extends StatefulWidget {
  const Form_Bottom_sheet({
    super.key,
  });

  @override
  State<Form_Bottom_sheet> createState() => _Form_Bottom_sheetState();
}

class _Form_Bottom_sheetState extends State<Form_Bottom_sheet> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, suptitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Custom_Text_Field(
            hint_txt: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Custom_Text_Field(
            hint_txt: "Content",
            maxlines: 5,
            onSaved: (value) {
              suptitle = value;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 60,
            child: ColorsItemList(),
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<addNoteCubit, addNoteState>(
            builder: (BuildContext context, state) {
              return Custom_Button(
                isLoading: state is loadingState ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    Add_note(context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  void Add_note(BuildContext context) {
    Note_Model note = Note_Model(
        title!,
        suptitle!,
        DateFormat(" yyyy-MM-dd ").format(DateTime.now()),
        Colors.yellowAccent.value);
    BlocProvider.of<addNoteCubit>(context).addNote(note);
    BlocProvider.of<fetchNotesCubit>(context).fetchNotes();
  }
}
