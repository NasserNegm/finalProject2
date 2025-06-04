import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/logic/login_bloc/cubit.dart';
import 'package:final_project/logic/login_bloc/state.dart';
import 'package:final_project/presentation/bottom_nav.dart';

import 'package:final_project/presentation/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///// I created object as a variable from (TextEditingController this buit in flutter ) for email and password
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
      passController.dispose();
    }

    //// I linked with cubit and firebase object (instace).
    return BlocProvider(
        create: (context) => LoginCubit(FirebaseAuth.instance),
        //// I used blockconsumer to use listener for changing and notification of state .
        ///
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login is successful'.tr())));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BottomNav()));
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('invalid email or passwod'.tr())));
          }
        },
            //////// I used builder to rebuild the full screen .

            builder: (context, state) {
          return Scaffold(
            body: Container(
              color: Colors.black,
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Instagram',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'myfont'),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, bottom: 10, left: 0),
                      padding: const EdgeInsets.only(left: 10),
                      height: 48,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        ////I create variable from controller type to call in logbutton.
                        controller: emailController,

                        textInputAction: TextInputAction.next,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,

                        decoration: InputDecoration(
                          hintText: 'Email'.tr(),
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 0),
                      padding: const EdgeInsets.only(left: 10),
                      height: 48,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        ////// I create variable from controller type to call in logbutton.
                        ///  ////// I create variable from controller type to call in logbutton.

                        controller: passController,

                        textInputAction: TextInputAction.done,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password'.tr(),
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ///// to not duplicate user email and password .

                        final userEmail = emailController.text;
                        final userPassword = passController.text;

                        ///////// I called the Cubit and its function to login with the password and email.

                        context
                            .read<LoginCubit>()
                            .enterLogin(userEmail, userPassword);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        height: 48,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Log in'.tr(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Don’t have an Email ?'.tr(),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: Text(
                            'Register'.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
// /////import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_app/logic/login_bloc/cubit.dart';
// import 'package:note_app/logic/login_bloc/state.dart';
// import 'package:note_app/presentation/home_screen.dart';
// import 'package:note_app/presentation/signup.dart';

// class Login extends StatelessWidget {
//   const Login({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ///// I created object as a variable from (TextEditingController this buit in flutter ) for email and password.

//     TextEditingController emailController = TextEditingController();
//     TextEditingController passController = TextEditingController();

//     /////////////////////

//     //// I linked with cubit and firebase object (instace).
//     return BlocProvider(
//       create: (context) => LoginCubit(FirebaseAuth.instance),

//       ///////// I used blockconsumer to use listener for changing and notification of state .

//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           if (state is LoginSuccessState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Login is successful')));
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomeScreen()));
//           } else if (state is LoginErrorState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('invalid email or passwod')));
//           }
//         },
//         //////// I used builder to rebuild the full screen .

//         builder: (context, state) {
//           return Scaffold(
//             body: Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: const Color.fromRGBO(18, 3, 17, 1),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Expanded(
//                     flex: 2,
//                     child: SizedBox(),
//                   ),
//                   const Text('Hi, Welcome Back! ',
//                       style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white)),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(right: 280),
//                     child: Text(
//                       'Email',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(top: 10, bottom: 20),
//                     padding: const EdgeInsets.only(left: 10),
//                     height: 48,
//                     width: 312,
//                     decoration: const BoxDecoration(
//                         color: Color.fromRGBO(242, 214, 241, 0.08),
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: TextFormField(
//                       ////// I create variable from controller type to call in logbutton.
//                       controller: emailController,
//                       textInputAction: TextInputAction.next,
//                       style: const TextStyle(color: Colors.white),
//                       cursorColor: Colors.white,
//                       decoration: const InputDecoration(
//                         hintText: 'example@gmail.com',
//                         hintStyle: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(right: 250),
//                     child: Text(
//                       'Password',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         color: Color.fromRGBO(255, 255, 255, 1),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(top: 10, bottom: 0),
//                     padding: const EdgeInsets.only(left: 10),
//                     height: 48,
//                     width: 312,
//                     decoration: const BoxDecoration(
//                         color: Color.fromRGBO(242, 214, 241, 0.08),
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: TextFormField(
//                       ////// I create variable from controller type to call in logbutton.

//                       controller: passController,
//                       textInputAction: TextInputAction.done,
//                       style: const TextStyle(color: Colors.white),
//                       cursorColor: Colors.white,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         hintText: 'Enter Your Password',
//                         hintStyle: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   const Expanded(
//                     child: SizedBox(),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       ///// to not duplicate user email and password .

//                       final userEmail = emailController.text;
//                       final userPassword = passController.text;

//                       ///////// I called the Cubit and its function to login with the password and email.

//                       context
//                           .read<LoginCubit>()
//                           .enterLogin(userEmail, userPassword);
//                     },
//                     child: Container(
//                       height: 48,
//                       width: 312,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: const Center(
//                           child: Text(
//                         'Login',
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       )),
//                     ),
//                   ),
//                   const Expanded(
//                     flex: 3,
//                     child: SizedBox(),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       const Text(
//                         'Don’t have an account ?',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => const SignUp()));
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
