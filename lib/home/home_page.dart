import 'package:devquiznlw/challenge/challenge_page.dart';
import 'package:devquiznlw/core/app_colors.dart';
import 'package:devquiznlw/home/widgetss/appbar/appbar_widget.dart';
import 'package:devquiznlw/home/widgetss/level_button/level_button_widget.dart';
import 'package:devquiznlw/home/widgetss/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.loading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppbarWidget(controller.user!),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengePage(questions: e.questions,)));
                          },
                          title: e.title,
                          completed:
                              "${e.questionAnswered}/${e.questions.length}",
                          percent: e.questionAnswered / e.questions.length))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
