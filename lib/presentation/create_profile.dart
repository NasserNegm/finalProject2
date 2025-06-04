import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/data_layer/profile_model.dart';
import 'package:final_project/logic/create_profile_bloc/cubit.dart';
import 'package:final_project/logic/create_profile_bloc/state.dart';

import 'package:final_project/presentation/login_screen.dart';
import 'package:final_project/presentation/mode/theme_provider.dart';
import 'package:final_project/widgets/Text_For.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextForm textName = TextForm(
    firstTextt: 'Name'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Name'.tr(),
    weightt: 65,
  );
  final TextForm textUserName = TextForm(
    firstTextt: 'UserName'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'UserName'.tr(),
    weightt: 20,
  );
  final TextForm textWebsite = TextForm(
    firstTextt: 'Website'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Website'.tr(),
    weightt: 47,
  );
  final TextForm textBio = TextForm(
    firstTextt: 'Bio'.tr(),
    maxLines: 2,
    minLines: 1,
    hintext: 'Bio'.tr(),
    weightt: 95,
  );
  final TextForm textEmail = TextForm(
    firstTextt: 'Email'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Email'.tr(),
    weightt: 65,
  );
  final TextForm textPhone = TextForm(
    firstTextt: 'Phone'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Phone'.tr(),
    weightt: 20,
  );
  final TextForm textGender = TextForm(
    firstTextt: 'Gender'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Gender'.tr(),
    weightt: 47,
  );

  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return BlocProvider(
      create: (context) => CreateProfileCubit(),
      child: BlocConsumer<CreateProfileCubit, CreateProfileState>(
        listener: (context, state) {
          if (state is CreateProfileSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile has Created Successfully')),
            );
          } else if (state is CreateProfileErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.er)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  color: isDarkMode ? Colors.black : const Color(0xFFFAFAFA),
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 25, left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          ),
                          child: Text(
                            'Cancel'.tr(),
                            style: TextStyle(
                              fontSize: 22,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          'Edit profile'.tr(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<CreateProfileCubit>().createProfile(
                                  ProfileModel(
                                    name: textName.textController.text,
                                    username: textUserName.textController.text,
                                    website: textWebsite.textController.text,
                                    bio: textBio.textController.text,
                                    email: textEmail.textController.text,
                                    phone: textPhone.textController.text,
                                    gender: textGender.textController.text,
                                  ),
                                );
                          },
                          child: Text(
                            'Done'.tr(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const AssetImage(
                                'assets/2021_05_15_16_22_IMG_2450.JPG')
                            as ImageProvider,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImage,
                  child: Text(
                    'Change Profile Photo'.tr(),
                    style: const TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 15),
                textName,
                const SizedBox(height: 25),
                textUserName,
                const SizedBox(height: 25),
                textWebsite,
                const SizedBox(height: 25),
                textBio,
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.grey,
                  indent: 30,
                  endIndent: 30,
                  thickness: 1,
                  height: 30,
                ),
                Text(
                  'Switch to Professional Account'.tr(),
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                const SizedBox(height: 15),
                textEmail,
                const SizedBox(height: 25),
                textPhone,
                const SizedBox(height: 25),
                textGender,
              ],
            ),
          );
        },
      ),
    );
  }
}

// class CreateProfile extends StatelessWidget {
//   CreateProfile({
//     super.key,
//   });
//   TextEditingController nameController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController websiteController = TextEditingController();
//   TextEditingController bioController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController genderController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => createProfileCubit(),
//         child: BlocConsumer<createProfileCubit, EditingProfileState>(
//           listener: (context, state) {
//             if (state is EditingProfileSuccessState) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text(
//                 'the Profile has Edited'.tr(),
//                 style: TextStyle(color: Colors.white),
//               )));
//             } else if (state is EditingProfileErroeState) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text(
//                 state.er,
//                 style: TextStyle(color: Colors.white),
//               )));
//             }
//           },
//           builder: (context, state) {
//             return SafeArea(
//               child: Scaffold(
//                 body: Container(
//                   color: Colors.black,
//                   height: double.infinity,
//                   width: double.infinity,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           // crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Navigator.pop(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const LoginScreen()));
//                               },
//                               child: Text(
//                                 'Cancel'.tr(),
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 20),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {},
//                               child: Text(
//                                 'Edit Profile'.tr(),
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 context
//                                     .read()<createProfileCubit>()
//                                     .editingProfile(ProfileModel(
//                                         name: nameController.text,
//                                         username: usernameController.text,
//                                         website: websiteController.text,
//                                         bio: bioController.text,
//                                         email: emailController.text,
//                                         phone: phoneController.hashCode,
//                                         gender: genderController.text));
//                               },
//                               child: Text(
//                                 'Done'.tr(),
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 20),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(200),
//                           child: Image.asset(
//                             "assets/2021_05_15_16_22_IMG_2450.JPG",
//                             fit: BoxFit.cover,
//                             height: 100,
//                             width: 100,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Change Profile Photo'.tr(),
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 30, left: 20),
//                                 child: Text(
//                                   'Name'.tr(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       left: 70, right: 30),
//                                   height: 50,
//                                   width: 400,
//                                   child: TextFormField(
//                                     controller: nameController,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: const InputDecoration(),
//                                   ),
//                                 ),
//                               )
//                             ]),
//                         Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 30, left: 20),
//                                 child: Text(
//                                   'Username'.tr(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       left: 30, right: 30),
//                                   height: 50,
//                                   width: 400,
//                                   child: TextFormField(
//                                     controller: usernameController,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: const InputDecoration(),
//                                   ),
//                                 ),
//                               )
//                             ]),
//                         Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 30, left: 20),
//                                 child: Text(
//                                   'Website'.tr(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       left: 54, right: 30),
//                                   height: 50,
//                                   child: TextFormField(
//                                     controller: websiteController,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: const InputDecoration(),
//                                   ),
//                                 ),
//                               )
//                             ]),
//                         Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     bottom: 30, left: 20, right: 0),
//                                 child: Text(
//                                   'Bio'.tr(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       left: 94, right: 30),
//                                   height: 70,
//                                   width: 400,
//                                   child: TextFormField(
//                                     controller: bioController,
//                                     maxLines: 3,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: const InputDecoration(
//                                         border: InputBorder.none),
//                                   ),
//                                 ),
//                               )
//                             ]),
//                         const Divider(),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               right: 80, top: 20, left: 0),
//                           child: Text(
//                             'Switch to Proffessional Account'.tr(),
//                             style: const TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               bottom: 10, top: 20, left: 0, right: 190),
//                           child: Text(
//                             'Private Information'.tr(),
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 30, left: 20),
//                                 child: Text(
//                                   'Email'.tr(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       left: 67, right: 30),
//                                   height: 50,
//                                   width: 400,
//                                   child: TextFormField(
//                                     controller: emailController,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: const InputDecoration(),
//                                   ),
//                                 ),
//                               )
//                             ]),
//                         Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 30, left: 20),
//                                 child: Text(
//                                   'Phone'.tr(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       left: 60, right: 30),
//                                   height: 50,
//                                   width: 400,
//                                   child: TextFormField(
//                                     controller: phoneController,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: const InputDecoration(),
//                                   ),
//                                 ),
//                               )
//                             ]),
//                         Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             // crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 30, left: 20),
//                                 child: Text(
//                                   'Gender'.tr(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: const EdgeInsets.only(
//                                       left: 50, right: 30),
//                                   height: 50,
//                                   width: 400,
//                                   child: TextFormField(
//                                     controller: genderController,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: const InputDecoration(),
//                                   ),
//                                 ),
//                               ),
//                             ]),
//                         InkWell(
//                           onTap: () {
//                             context.read()<createProfileCubit>().editingProfile(
//                                 ProfileModel(
//                                     name: nameController.text,
//                                     username: usernameController.text,
//                                     website: websiteController.text,
//                                     bio: bioController.text,
//                                     email: emailController.text,
//                                     phone: phoneController.hashCode,
//                                     gender: genderController.text));
//                           },
//                           child: Container(
//                             height: 100,
//                             width: 100,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ));
//   }
// }
