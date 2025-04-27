import 'package:final_project/data_layer/profile_model.dart';
import 'package:final_project/logic/editing_profile_bloc/cubit.dart';
import 'package:final_project/logic/editing_profile_bloc/state.dart';
import 'package:final_project/presentation/home_page.dart';
import 'package:final_project/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EditingProfileCubit(),
        child: BlocConsumer<EditingProfileCubit, EditingProfileState>(
          listener: (context, state) {
            if (state is EditingProfileSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                'the Profile has Edited',
                style: TextStyle(color: Colors.white),
              )));
            } else if (state is EditingProfileErroeState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                state.er,
                style: TextStyle(color: Colors.white),
              )));
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  color: Colors.black,
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context
                                    .read()<EditingProfileCubit>()
                                    .editingProfile(ProfileModel(
                                        name: nameController.text,
                                        username: usernameController.text,
                                        website: websiteController.text,
                                        bio: bioController.text,
                                        email: emailController.text,
                                        phone: phoneController.hashCode,
                                        gender: genderController.text));
                              },
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(
                            "assets/2021_05_15_16_22_IMG_2450.JPG",
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Change Profile Photo',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 20),
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 70, right: 30),
                                  height: 50,
                                  width: 400,
                                  child: TextFormField(
                                    controller: nameController,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              )
                            ]),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 20),
                                child: Text(
                                  'Username',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  height: 50,
                                  width: 400,
                                  child: TextFormField(
                                    controller: usernameController,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              )
                            ]),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 20),
                                child: Text(
                                  'Website',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 54, right: 30),
                                  height: 50,
                                  child: TextFormField(
                                    controller: websiteController,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              )
                            ]),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    bottom: 30, left: 20, right: 0),
                                child: Text(
                                  'Bio',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 94, right: 30),
                                  height: 70,
                                  width: 400,
                                  child: TextFormField(
                                    controller: bioController,
                                    maxLines: 3,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            ]),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.only(right: 80, top: 20, left: 0),
                          child: Text(
                            'Switch to Proffessional Account',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              bottom: 10, top: 20, left: 0, right: 190),
                          child: Text(
                            'Private Information',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 20),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 67, right: 30),
                                  height: 50,
                                  width: 400,
                                  child: TextFormField(
                                    controller: emailController,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              )
                            ]),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 20),
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 60, right: 30),
                                  height: 50,
                                  width: 400,
                                  child: TextFormField(
                                    controller: phoneController,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              )
                            ]),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 30, left: 20),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 50, right: 30),
                                  height: 50,
                                  width: 400,
                                  child: TextFormField(
                                    controller: genderController,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(),
                                  ),
                                ),
                              ),
                            ]),
                        InkWell(
                          onTap: () {
                            context
                                .read()<EditingProfileCubit>()
                                .editingProfile(ProfileModel(
                                    name: nameController.text,
                                    username: usernameController.text,
                                    website: websiteController.text,
                                    bio: bioController.text,
                                    email: emailController.text,
                                    phone: phoneController.hashCode,
                                    gender: genderController.text));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
