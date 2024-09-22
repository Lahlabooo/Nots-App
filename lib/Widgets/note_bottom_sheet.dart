import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_note_cubit/add_Note_cubit.dart';
import '../add_note_cubit/add_Note_state.dart';
import 'Form_Bottom_sheet.dart';

class note_bottom_sheet extends StatelessWidget {
  const note_bottom_sheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => addNoteCubit(),
      child: BlocConsumer<addNoteCubit, addNoteState>(
        listener: ( context,  state) {
        if (state is failureState)
          {
            debugPrint("failed ${state.errMessage}");
          }
        if (state is successState)
        {
          Navigator.pop(context);
        }
        },
          builder: ( context, state) {
            return  AbsorbPointer(
              absorbing: state is loadingState ? true : false ,
              child:  Padding(
                padding:  EdgeInsets.only(left: 25.0,right: 25.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const SingleChildScrollView(
                    child:   Form_Bottom_sheet()),
              ),
            );
          },

       ),
    );
  }
}

