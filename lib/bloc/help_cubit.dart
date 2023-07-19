
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/model/helpscreen_model.dart';
import '../network/dio.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());

  static HelpCubit get(context) => BlocProvider.of(context);

  List<String> questions = [];
  List<String> answers = [];
  List<bool> isExpandedList = [];

  void expandBottom(int index) {
    isExpandedList[index] = !isExpandedList[index];
    emit(ExpandBottom());
  }
  bool getExpandedState(int index) {
    return isExpandedList[index];
  }


  void helpData() {
    DioHelper.getData(url: 'https://magdsoft.ahmedshawky.fun/api/getHelp').then((value) {
      final responseJson = value.data as Map<String, dynamic>;
      final helpmodel = HelpModel.fromJson(responseJson);
      final List<Help> helpItems = helpmodel.help ?? [];

      questions.clear();
      answers.clear();
      isExpandedList.clear();

      // Store questions and answers from each HelpItem
      for (final item in helpItems) {
        questions.add('${item.question}');
        answers.add('${item.answer}');
        isExpandedList.add(false);
      }

      emit(HelpData());
    });
  }
}

