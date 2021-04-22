
import 'package:devquiznlw/challenge/widgets/question_indicator_widget.dart';
import 'package:devquiznlw/challenge/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SafeArea(top: true, child: QuestionIndicatorWidget()),
      ),
      body: Column(
        children: [
          QuizWidget(title: "O que o flutter faz em sua totalidade?"),
        ],
      ),
    );
  }
}
