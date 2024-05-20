import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'BigText.dart';
import 'Icon_and_Text_Widgets.dart';
import 'SmallText.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ), //Comments Section
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                );
              }),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "1278",
              color: Color.fromARGB(255, 132, 136, 136),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(
                text: "comments", color: Color.fromARGB(255, 132, 136, 136))
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidgets(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1,
                textcolor: AppColors.fontColor),
            IconAndTextWidgets(
                icon: Icons.location_on,
                text: "1.3Km",
                iconColor: AppColors.mainColor,
                textcolor: AppColors.fontColor),
            IconAndTextWidgets(
                icon: Icons.access_time_filled_rounded,
                text: "27min",
                iconColor: AppColors.iconColor2,
                textcolor: AppColors.fontColor),
          ],
        ),
      ],
    );
  }
}
