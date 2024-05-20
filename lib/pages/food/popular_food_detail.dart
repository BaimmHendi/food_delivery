import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/App_column.dart';
import 'package:food_delivery/widgets/App_icon.dart';
import 'package:food_delivery/widgets/Exandable_text_widget.dart';
import 'package:food_delivery/widgets/BigText.dart';
import 'package:food_delivery/widgets/Icon_and_Text_Widgets.dart';
import 'package:food_delivery/widgets/SmallText.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/image/american-shrimp-fried-rice.jpg"))),
              )),
          //icon widgets
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined)
                ],
              )),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: "Nasi Goreng Seafood"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                      Expanded(
                          child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut suscipit at nisi non iaculis. Aenean eget augue augue. Phasellus nec accumsan mi, sit amet faucibus leo. Suspendisse ex quam, commodo et ligula id, mattis sollicitudin urna. Vivamus ultricies massa eu tortor posuere condimentum. Donec tempus ante justo. Nullam egestas ac ante et sodales. Duis consectetur sit amet lorem et facilisis. Phasellus elementum, ipsum eu aliquam tempus, nulla ipsum faucibus urna, ac convallis velit orci sit amet est. Debian 11",
                            color: AppColors.fontColor),
                      ))
                    ]),
              )),
          //expandable text widget
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeight,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(Icons.add, color: AppColors.signColor)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: BigText(
                text: "\10K | Taro keranjang",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor),
            )
          ],
        ),
      ),
    );
  }
}
