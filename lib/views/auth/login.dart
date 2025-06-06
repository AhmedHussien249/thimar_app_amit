import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:themar_app_amit/core/logic/helper.dart';
import 'package:themar_app_amit/views/home/view.dart';
import '../../core/designs/app_button.dart';
import '../../core/designs/app_images.dart';
import '../../core/designs/app_input.dart';
import '../../core/logic/app_theme.dart';
import '../../core/logic/input_validator.dart';
import '../../features/login/bloc.dart';
import '../sections_view.dart';
import 'components/have_account_or_not.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = GetIt.instance<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: bloc.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppImages(
                  "logo.png",
                  width: 130.w,
                  height: 125.h,
                ),
                SizedBox(height: 16.h),
                Text(
                  "welcomeTo".tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "youCanLoginNow".tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppTheme.grey,
                  ),
                ),
                SizedBox(height: 24.h),
                AppInput(
                  controller: bloc.phoneController,
                  label: "phoneNumber".tr(),
                  prefixIcon: "phone.png",
                  validator: InputValidator.phone,
                  inputType: InputType.phone,
                  keyboardType: TextInputType.phone,
                ),
                AppInput(
                  controller: bloc.passwordController,
                  label: "password".tr(),
                  prefixIcon: "password.png",
                  validator: InputValidator.password,
                  inputType: InputType.password,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      // navigateTo(const ForgetPasswordView());
                    },
                    child: Text("forgetPassword".tr()),
                  ),
                ),
                SizedBox(height: 16.h),
                BlocConsumer(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        navigateTo(HomeView(), keepHistory: false);
                      }
                    },
                    builder: (context, state) => AppButton(
                          isLoading: state is LoginLoadingState,
                          onPressed: () {
                            bloc.add(LoginEvent());
                          },
                          text: "login".tr(),
                        )),
                HaveAccountOrNot()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
