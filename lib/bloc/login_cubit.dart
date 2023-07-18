import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/views/verify_phone.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../network/dio.dart';
import '../views/login_screen.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController userName = TextEditingController();
 static TextEditingController userPhone = TextEditingController();
  TextEditingController codePhone = TextEditingController();

  void login(BuildContext context) {
    var data = {
      "name": userName.text,
      "phone": userPhone.text,
    };
    DioHelper.postData(
      url: 'https://magdsoft.ahmedshawky.fun/api/verifyPhone',
      data: data,
    ).then((value) {
      print(value.data);
      print(value.statusCode);
      if (value.statusCode == 200) {
        final responseJson = value.data as Map<String, dynamic>;
        final code = responseJson['code'].toString();


        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VerifyPhone()),
        );

        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: 'Code: $code',
          ),
        );
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }


}
