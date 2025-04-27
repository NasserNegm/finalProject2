import 'package:final_project/logic/signup_bloc/cubit.dart';
import 'package:final_project/logic/signup_bloc/state.dart';
import 'package:final_project/presentation/home_page.dart';
import 'package:final_project/presentation/login_screen.dart';
import 'package:final_project/presentation/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    ///// I created object as a variable from (TextEditingController this buit in flutter ) for email and password.
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController repassController = TextEditingController();

    /////////////////

    return BlocProvider(
      //// I linked with cubit and firebase object (instace).
      create: (context) => SignupCubit(FirebaseAuth.instance),

      ///////// I used blockconsumer to use listener for changing and notification of state .
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Your email and password were created')),
            );
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          } else if (state is SignupErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.Er)));
          }
        },
        //////// I used builder to rebuild the full screen .
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 300, bottom: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text('Create New Account ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 270),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    padding: const EdgeInsets.only(left: 10),
                    height: 48,
                    width: 312,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      ////// I create variable from controller type to call in logbutton.

                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintText: 'example@gmail.com',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 240),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 0),
                    padding: const EdgeInsets.only(left: 10),
                    height: 48,
                    width: 312,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      ////// I create variable from controller type to call in logbutton.

                      controller: passController,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 0),
                    padding: const EdgeInsets.only(left: 10),
                    height: 48,
                    width: 312,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      ////// I create variable from controller type to call in logbutton.

                      controller: repassController,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Re-Enter Your Password',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      ///// to not duplicate user email and password .
                      final userEmail = emailController.text;
                      final userPassword = passController.text;
                      final reuserPassword = repassController.text;

                      ///////// I called the Cubit and its function to create the password and email.
                      context.read<SignupCubit>().createSiginup(
                          userEmail, userPassword, reuserPassword);
                    },
                    child: Container(
                      height: 48,
                      width: 312,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )),
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'You have already an account ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
