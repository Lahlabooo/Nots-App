import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:nots_app/fetchNotes_cubit/fetch_notes_cubit.dart';

import 'Models/Nots_Model.dart';
import 'Views/Nots_view.dart';

import 'bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox('Notes_box');
  runApp(const Nots_app());
}

class Nots_app extends StatelessWidget {
  const Nots_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => fetchNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: "assets/fonts/Poppins-Regular.ttf"),
        home: const Nots_View(),
      ),
    );
  }
}
