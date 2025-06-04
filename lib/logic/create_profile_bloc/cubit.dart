import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/data_layer/profile_model.dart';
import 'package:final_project/logic/create_profile_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileInitialState());

  ////////////function to set note data to firebase .

  Future createProfile(ProfileModel prof) async {
    emit(CreateProfileLoadingState());
    try {
      await FirebaseFirestore.instance.collection('profile').add(prof.toJson());
      emit(CreateProfileSuccessState());
    } catch (e) {
      emit(CreateProfileErrorState(e.toString()));
    }
  }
}
