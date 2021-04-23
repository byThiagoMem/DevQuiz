import 'file:///C:/AndroidStudioProjects/devquiznlw/lib/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiznlw/challenge/challenge_controller.dart';
import 'package:devquiznlw/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiznlw/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiznlw/shared/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  final controller = ChallengeController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    length: widget.questions.length,
                  ),
                )
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: NextButtonWidget.white(
                  label: "Pular",
                  onTap: () {
                    pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
                  },
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: NextButtonWidget.green(label: "Confirmar", onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
