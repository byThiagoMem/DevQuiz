
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:devquiznlw/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
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
                "Questão 04",
                style: AppTextStyles.body,
              ),
              Text(
                "de 10",
                style: AppTextStyles.body,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ProgressIndicatorWidget(value: 0.5),
          ),

        ],
      ),
    );
  }
}
