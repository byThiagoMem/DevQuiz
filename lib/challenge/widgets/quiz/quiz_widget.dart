import 'package:devquiznlw/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {

  final String  title;
  QuizWidget({required this.title});

  @override
  Widget  build(BuildContext  context) {
    return Container(
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading,),
          SizedBox(height: 24.0,),
          AwnserWidget("Possibilita a criação de aplicativos compilados nativamente", false, true),
          AwnserWidget("Possibilita a criação de aplicativos compilados nativamente", false, false),
          AwnserWidget("Possibilita a criação de aplicativos compilados nativamente", false, false),
          AwnserWidget("Possibilita a criação de aplicativos compilados nativamente", false, false),
        ],
      ),
    );
  }
}