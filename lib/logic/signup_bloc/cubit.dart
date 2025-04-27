import 'package:final_project/logic/signup_bloc/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_app/logic/signup_bloc/state.dart';

class SignupCubit extends Cubit<SignupState> {
  /////// I create object (firebase) from firebaseAuth to create instance in blocprovider.

  final FirebaseAuth firebase;
  SignupCubit(this.firebase) : super(SignupInitialState());
  /////////////methods to create email and password on firebase.
  /////and create  two variables from String type. to I call them in function(createUserWithEmailAndPassword)

  Future createSiginup(String e, String pass, String repass) async {
    emit(SignupLoadingState());

    try {
      await firebase.createUserWithEmailAndPassword(email: e, password: repass);
      emit(SignupSuccessState());
    } catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }
}
