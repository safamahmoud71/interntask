import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/bloc/login_cubit.dart';
import 'package:meta/meta.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../network/dio.dart';
import '../views/home_screen.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  static OtpCubit get(context)=>BlocProvider.of(context);

  TextEditingController otp = TextEditingController();

  void verifyPhone(BuildContext context) {
    var data = {
      "code": otp.text,
      "phone" : LoginCubit.userPhone.text,


    };
    DioHelper.postData(
      url: 'https://magdsoft.ahmedshawky.fun/api/otp',
      data: data,
    ).then((value) {
      print(value.data);
      print(value.statusCode);
      if (value.statusCode == 200) {
        final responseJson = value.data as Map<String, dynamic>;


        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  HomeScreen()),
        );

        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: 'Login successfully',
          ),
        );
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }
}
