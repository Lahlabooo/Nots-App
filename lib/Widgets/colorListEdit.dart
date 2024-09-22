
import 'package:flutter/material.dart';
import 'package:nots_app/Models/Nots_Model.dart';

import '../constants.dart';
import 'colorItem.dart';

class ColorListEdit extends StatefulWidget {
  const ColorListEdit({super.key, required this.note});
final Note_Model note ;
  @override
  State<ColorListEdit> createState() => _ColorListEditState();
}

class _ColorListEditState extends State<ColorListEdit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = colors.indexOf(Color(widget.note.color));
  }
  int?  currentIndex ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: colors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder:(context, index){
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:   InkWell(
            onTap: (){
              currentIndex = index ;
             widget.note.color = colors[index].value;
             //widget.note.save();
              setState(() {

              });
            },
            child:  ColorItem(
              color: colors[index],
              isActive: currentIndex == index ,
            ),
          ),
        );
      } ,

    );
  }
}
