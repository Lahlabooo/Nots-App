import 'package:flutter/material.dart';
import 'package:nots_app/Models/Nots_Model.dart';

import '../Widgets/Edit_Nots_Body.dart';

class Edit_Nots_View extends StatelessWidget {
  const Edit_Nots_View({super.key, required this.note});
final Note_Model note ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Edit_Nots_Body(note: note,) ,
    );
  }
}
