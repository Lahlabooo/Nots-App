import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nots_app/Models/Nots_Model.dart';
import 'package:nots_app/Views/Edit_Nots_View.dart';

import '../fetchNotes_cubit/fetch_notes_cubit.dart';

class nots_item extends StatelessWidget {
  const nots_item({super.key, required this.note});
final Note_Model note ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5,bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
          return    Edit_Nots_View(note: note,);
          },));
        },
        child: Container(
          padding:const EdgeInsets.only(top: 30,left: 20,bottom: 30),

          decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(note.title,
                  style:const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                subtitle:  Text(note.suptitle,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
                trailing: IconButton(onPressed: (){
                  note.delete();
                  BlocProvider.of<fetchNotesCubit>(context).fetchNotes();
                },
                    icon:const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.black,
                    )
                ),
              ),
              const SizedBox(height: 10,),
               Padding(
                padding:const EdgeInsets.only(right: 15.0),
                child: Text(note.date,
                  style:const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}