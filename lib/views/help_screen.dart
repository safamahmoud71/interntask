import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/bloc/help_cubit.dart';
import 'package:interntask/views/home_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCubit()..helpData(),
      child: BlocConsumer<HelpCubit, HelpState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HelpCubit myCubit = HelpCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [Color(0xff0062BD), Colors.white],
                  ),
                ),
                child: Column(

                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Text(
                        'Help',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Expanded(
                      child: ListView.builder(

                        itemBuilder: (context, index) {

                          String question = myCubit.questions[index];
                          String answer = myCubit.answers[index];
                          bool isExpanded = myCubit.getExpandedState(index);

                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30, top: 20),
                                child: Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        tileColor:  Colors.white,
                                        selectedColor: Colors.white,



                                        title: Text(question,style: const TextStyle(
                                          color: Color(0xff0062BD)
                                        ),),
                                        trailing: IconButton(
                                          icon: Icon(
                                            isExpanded
                                                ? Icons.expand_less
                                                : Icons.expand_more,
                                            size: 35,
                                          ),
                                          onPressed: () {
                                            myCubit.expandBottom(index);
                                          },
                                        ),
                                      ),
                                      if (isExpanded)
                                        Container(
                                          decoration: const BoxDecoration(

                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight:Radius.circular(15) )
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(answer , style: const TextStyle(
                                                  color: Color(0xff464646)
                                                ),),
                                              ),
                                            ],
                                          ),

                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: myCubit.questions.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0062BD),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Usage
