import 'package:devquiznlw/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:devquiznlw/shared/answer_model.dart';
import 'package:devquiznlw/shared/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  QuizWidget({Key? key, required this.question, required this.onChange}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            this.widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AnswerWidget(
              awnser: awnser((i)),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (){
                indexSelected = i;
                widget.onChange();
                setState(() {
                });
              },
            ),
        ],
      ),
    );
  }
}
