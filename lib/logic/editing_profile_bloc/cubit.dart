import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/data_layer/profile_model.dart';
import 'package:final_project/logic/editing_profile_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditingProfileCubit extends Cubit<EditingProfileState> {
  EditingProfileCubit() : super(EditingProfileInitialState());

  ////////////function to set note data to firebase .

  Future editingProfile(ProfileModel prof) async {
    emit(EditingProfileLoadingState());
    try {
      await FirebaseFirestore.instance.collection('profile').add(prof.toJson());
      emit(EditingProfileSuccessState());
    } catch (e) {
      emit(EditingProfileErroeState(e.toString()));
    }
  }
}
