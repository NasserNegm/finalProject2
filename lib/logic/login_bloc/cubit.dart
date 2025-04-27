import 'package:final_project/logic/login_bloc/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_app/logic/login_bloc/state.dart';

class LoginCubit extends Cubit<LoginState> {
  /////// I create object (firebase) from firebaseAuth to create instance in blocprovider.
  final FirebaseAuth firebase;
  LoginCubit(this.firebase) : super(LoginInitialState());

  /////////////methods to create email and password on firebase.
  /////and create  two variables from String type. to I call them in function(signInWithEmailAndPassword)
  Future enterLogin(String e, String pass) async {
    emit(LoginLoadingState());
    try {
      await firebase.signInWithEmailAndPassword(email: e, password: pass);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
