
import 'package:devquiznlw/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:devquiznlw/shared/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            this.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ...question.awnsers.map(
                (e) => AnswerWidget(
              title: e.title,
              isRight: e.isRight,
            ),
          ),
        ],
      ),
    );
  }
}