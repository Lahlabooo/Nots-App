
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_note_cubit/add_Note_cubit.dart';
import '../constants.dart';
import 'colorItem.dart';

class ColorsItemList extends StatefulWidget {
  const ColorsItemList({
    super.key,
  });

  @override
  State<ColorsItemList> createState() => _ColorsItemListState();
}

class _ColorsItemListState extends State<ColorsItemList> {
  int? currentIndex  ;

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
              BlocProvider.of<addNoteCubit>(context).color = colors[index];
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

