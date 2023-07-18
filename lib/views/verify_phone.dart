import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/bloc/otp_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class VerifyPhone extends StatelessWidget {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => OtpCubit(),
  child: BlocConsumer<OtpCubit, OtpState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    OtpCubit  myCubit = OtpCubit.get(context);
    return Scaffold(

      body: SafeArea(
        child: Container(

            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Color(0xff0062BD),Colors.white],
              ),
            ),


          child: Padding(
            padding: const EdgeInsets.only(top :38),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Verify Phone', style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 150,left: 50.0, right: 50),
                    child: PinCodeTextField(appContext: context, length: 4,
                      cursorHeight: 50,

                      enableActiveFill: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          inactiveColor: Colors.white,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedColor: Colors.white,

                          borderRadius: BorderRadius.circular(15)
                      ),
                      onChanged:((value){}) ,
                    ),
                  ),
                  SizedBox(height: 50,),
                  TextButton(onPressed: (){},
                      child: Text('Resend Code',
                      style: TextStyle(color: Color(0xff0062BD),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter'),
                      )),
                 SizedBox(height: 50,),
                  Container(
                    width: 280,
                    height: 50,

                    child: ElevatedButton(
                      onPressed: () {
                        myCubit.verifyPhone(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0062BD),
                      ),
                      child: Text(
                        'verify',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    )
    );
  },
),
);
  }
}
