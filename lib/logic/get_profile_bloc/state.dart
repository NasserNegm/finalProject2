import 'package:final_project/data_layer/profile_model.dart';

class GetProfileState {}

class GetProfileInitialState extends GetProfileState {}

class GetProfileLoadingState extends GetProfileState {}

class GetProfileSuccessState extends GetProfileState {
  List<ProfileModel> getprof;
  GetProfileSuccessState(this.getprof);
}

class GetProfileErrorState extends GetProfileState {
  final String er;
  GetProfileErrorState({required this.er});
}
