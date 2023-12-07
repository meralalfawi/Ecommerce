import 'package:ecommerce/domain/di.dart';
import 'package:ecommerce/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:ecommerce/ui/auth/login/cubit/login_states.dart';
import 'package:ecommerce/ui/auth/register/register_screen.dart';
import 'package:ecommerce/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/mytheme.dart';
import '../../utils/text_field_item.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'waiting');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', positiveActionName: "Ok");
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'Login successfully',
              title: 'Success', positiveActionName: "Ok");
        }
      },
      child: Scaffold(
        body: Container(
          color: MyTheme.primary,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 91.h,
                    bottom: 46.h,
                    left: 97.w,
                    right: 97.w,
                  ),
                  child: Image.asset('assets/images/route_pic.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'enter your email',
                                controller: viewModel.emailController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Please enter Email';
                                  }
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(text);
                                  if (!emailValid) {
                                    return 'Please enter valid email';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Password',
                                keyboardType: TextInputType.number,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                ),
                                hintText: 'enter your password',
                                controller: viewModel.passwordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  if (text.length < 6) {
                                    return 'Password should be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.login();
                                  },
                                  child: Text(
                                    'login',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10)),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, RegisterScreen.routeName);
                                  },
                                  child: Text('Dont have an account?'))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
