import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/data_layer/profile_model.dart';
import 'package:final_project/logic/get_profile_bloc/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_app/logic/login_bloc/state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  /////// I create object (firebase) from firebaseAuth to create instance in blocprovider.

  GetProfileCubit() : super(GetProfileInitialState());

  /////////////methods to get edited profile

  Future getProfile() async {
    emit(GetProfileLoadingState());
    try {
      final response =
          await FirebaseFirestore.instance.collection('profile').get();
      final getprof =
          response.docs.map((e) => ProfileModel.fromJson(e.data())).toList();

      emit(GetProfileSuccessState(getprof));
    } catch (e) {
      emit(GetProfileErrorState(er: e.toString()));
    }
  }
}
