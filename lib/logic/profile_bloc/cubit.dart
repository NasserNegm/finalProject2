import 'package:final_project/logic/profile_bloc/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_app/logic/login_bloc/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  /////// I create object (firebase) from firebaseAuth to create instance in blocprovider.
  final FirebaseAuth firebase;
  ProfileCubit(this.firebase) : super(ProfileInitialState());

  /////////////methods to create email and password on firebase.
  /////and create  two variables from String type. to I call them in function(signInWithEmailAndPassword)
  Future enterLogin(String e, String pass) async {
    emit(ProfileLoadingState());
    try {
      await firebase.signInWithEmailAndPassword(email: e, password: pass);
      emit(ProfileSuccessState());
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}
