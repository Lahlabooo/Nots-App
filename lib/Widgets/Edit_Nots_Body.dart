import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nots_app/Models/Nots_Model.dart';
import 'package:nots_app/Widgets/Custom_Text_Field.dart';
import 'package:nots_app/Widgets/Custom_appBar.dart';
import 'package:nots_app/Widgets/colorListEdit.dart';
import 'package:nots_app/fetchNotes_cubit/fetch_notes_cubit.dart';

class Edit_Nots_Body extends StatefulWidget {
  const Edit_Nots_Body({super.key, required this.note});
final Note_Model note ;
  @override
  State<Edit_Nots_Body> createState() => _Edit_Nots_BodyState();
}

class _Edit_Nots_BodyState extends State<Edit_Nots_Body> {
String? Title , supTitle ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child:  Column(
        children: [
           Custom_appBar(title: 'Edit',
            icon: Icons.check,
            onPressed: (){
              Edit_data(context);
            },
          ),
          const  SizedBox(height:25,),
          Custom_Text_Field(
              hint_txt: widget.note.title,
            onChanged: (value){
               Title = value ;
            },
          ),
          const SizedBox(height:20,),
          Custom_Text_Field(
            hint_txt: widget.note.suptitle,
            maxlines: 5,
            onChanged: (value){
              supTitle  = value ;
            },
          ),
         const  SizedBox(height: 25,),
           SizedBox(
           height:60,
           child: ColorListEdit(note: widget.note,),),
        ],
      ),

    );
  }

  void Edit_data(BuildContext context) {
    widget.note.title = Title ?? widget.note.title;
    widget.note.suptitle = supTitle ?? widget.note.suptitle;
    widget.note.save();
    BlocProvider.of<fetchNotesCubit>(context).fetchNotes();
    Navigator.pop(context);
  }
}
