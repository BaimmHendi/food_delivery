import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/SmallText.dart';

class IconAndTextWidgets extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;
  const IconAndTextWidgets(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      required Color textcolor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
