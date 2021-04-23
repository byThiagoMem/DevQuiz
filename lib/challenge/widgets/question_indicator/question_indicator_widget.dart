
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:devquiznlw/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  const QuestionIndicatorWidget({Key? key, required this.currentPage, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "de $length",
                style: AppTextStyles.body,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ProgressIndicatorWidget(value: currentPage / length),
          ),

        ],
      ),
    );
  }
}
