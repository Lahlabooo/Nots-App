abstract class addNoteState {}

class initialState extends addNoteState{}
class loadingState extends addNoteState{}
class successState extends addNoteState{}
class failureState extends addNoteState{
  final String errMessage ;
  failureState(this.errMessage);

}