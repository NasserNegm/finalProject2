class EditingProfileState {}

class EditingProfileInitialState extends EditingProfileState {}

class EditingProfileLoadingState extends EditingProfileState {}

class EditingProfileSuccessState extends EditingProfileState {}

class EditingProfileErroeState extends EditingProfileState {
  final String er;
  EditingProfileErroeState(this.er);
}
