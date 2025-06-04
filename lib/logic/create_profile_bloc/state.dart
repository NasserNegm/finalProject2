class CreateProfileState {}

class CreateProfileInitialState extends CreateProfileState {}

class CreateProfileLoadingState extends CreateProfileState {}

class CreateProfileSuccessState extends CreateProfileState {}

class CreateProfileErrorState extends CreateProfileState {
  final String er;
  CreateProfileErrorState(this.er);
}
