import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  const Custom_Text_Field({super.key, required this.hint_txt,  this.maxlines = 1, this.onSaved, this.onChanged});
  final String hint_txt ;
  final int maxlines;
 final void Function(String)? onChanged;
 final  void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true){
          return "filled must not be empty ";
        }
        return null ;
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(15),
        borderSide:const  BorderSide(
           color: Colors.white,
         )
     ),
        hintText: hint_txt,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}