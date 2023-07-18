import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/bloc/login_cubit.dart';

import '../componet/componet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    LoginCubit myCubit = LoginCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: screenHeight * 1.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 10,
                                thickness: 1,
                                color: Color(0xff0062BD),
                                endIndent: 20,
                                indent: 30,
                              ),
                            ),
                            Text(
                              'OR',
                              style: TextStyle(
                                  color: Color(0xff0062BD), fontSize: 15),
                            ),
                            Expanded(
                              child: Divider(
                                height: 10,
                                thickness: 1,
                                color: Color(0xff0062BD),
                                endIndent: 40,
                                indent: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[400]!,
                                      blurRadius: 5.0,
                                      spreadRadius: 2),
                                ]),
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/f.png',
                                width: 35,
                              ),
                              iconSize: 50,
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[400]!,
                                      blurRadius: 5.0,
                                      spreadRadius: 2),
                                ]),
                            child: IconButton(
                              style: ButtonStyle(

                                  //shadowColor: MaterialStateProperty.all(Colors.black26),
                                  ),
                              icon: Image.asset(
                                'assets/images/ios 2.png',
                                width: 35,
                              ),
                              iconSize: 50,
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[400]!,
                                      blurRadius: 5.0,
                                      spreadRadius: 2),
                                ]),
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/Google__G__Logo 2.png',
                                width: 35,
                              ),
                              iconSize: 50,
                              onPressed: () {},
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 193, left: 29),
              child: Container(
                height: 335,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 20.0,
                          spreadRadius: 5.0)
                    ]),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff464646),
                        fontFamily: 'inter',
                      ),
                    )),
                    Divider(
                      height: 30,
                      thickness: 3.13,
                      color: Color(0xff0062BD),
                      endIndent: 100,
                      indent: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Container(
                        height: 48,
                        width: 282,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  spreadRadius: 2
                                  //  offset: Offset(0,10),
                                  )
                            ]),
                        child: DefaultFormFeild(hintText: 'Enter your Full Name', Text: myCubit.userName,

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Container(
                        height: 48,
                        width: 282,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  spreadRadius: 2
                                  //  offset: Offset(0,10),
                                  )
                            ]),
                        child: DefaultFormFeild(hintText: 'Enter your Phone Number',Text: LoginCubit.userPhone,),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 280,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0062BD), Colors.white,]
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                         myCubit.login(context);

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff0062BD),
                        ),
                        child: Text(
                          'Login',
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
          ],
        ),
      ),
    );
  },
),
);
  }
}


