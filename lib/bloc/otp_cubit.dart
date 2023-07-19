import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/bloc/login_cubit.dart';
import 'package:interntask/views/help_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../network/dio.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);

  TextEditingController otp = TextEditingController();

  void verifyPhone(BuildContext context) {
    var data = {
      "code": otp.text,
      "phone": LoginCubit.userPhone.text,
    };
    DioHelper.postData(
      url: 'https://magdsoft.ahmedshawky.fun/api/otp',
      data: data,
    ).then((value) {
      print(value.data);
      print(value.statusCode);
      if (value.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelpScreen()),
        );

        showTopSnackBar(
          context,
          const CustomSnackBar.success(
            message: 'Login successfully',
          ),
        );
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }
}
