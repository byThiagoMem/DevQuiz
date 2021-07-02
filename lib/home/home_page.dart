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
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppbarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 32,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    LevelButtonWidget(label: 'Fácil'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Médio'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Difícil'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Perito'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          completed:
                              '${e.questionAnswered}/${e.questions.length}',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  title: e.title,
                                  questions: e.questions,
                                ),
                              ),
                            );
                          },
                          percent: e.questionAnswered / e.questions.length,
                          image: e.imagem,
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
