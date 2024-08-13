// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  String? email;
  static String id = 'RegisterPage';

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading == true;
        } else if (state is RegisterSuccess) {
          BlocProvider.of<ChatCubit>(context).getMassages();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading == false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errorMassage);
          isLoading == false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: kPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 75,
                      ),
                      Image.asset(
                        'assets/images/scholar.png',
                        height: 100,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Scholar Chat",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Pacifico",
                                fontSize: 32),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      const Row(
                        children: [
                          Text(
                            "register",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: "email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: "password",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).registerUser(
                                email: email!, password: password!);
                          }
                        },
                        buttonText: "register",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'already have an account ?    ',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'login',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
