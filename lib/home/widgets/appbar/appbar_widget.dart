import 'package:devquiznlw/core/app_gradients.dart';
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:devquiznlw/home/widgets/appbar/score_card/score_card_widget.dart';
import 'package:devquiznlw/shared/widgets/progress_indicator/models/user_model.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends PreferredSize{

  final UserModel user;

  AppbarWidget(this.user) : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 161,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: AppGradients.linear,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                      text: "Olá, ",
                      style: AppTextStyles.title,
                      children: [
                        TextSpan(
                          text: user.name,
                          style: AppTextStyles.titleBold,
                        ),
                      ]),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            user.photoUrl),
                      )),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.1, 1.0),
            child: ScoreCardWidget(),
          ),
        ],
      ),
    ),
  );
}