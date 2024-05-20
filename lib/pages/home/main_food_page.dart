import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/BigText.dart';
import 'package:food_delivery/widgets/SmallText.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/dimensions.dart';

class mainfoodpage extends StatefulWidget {
  const mainfoodpage({super.key});

  @override
  State<mainfoodpage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<mainfoodpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //showing the header
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Indonesia",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Jawa Tengah",
                            color: Colors.black54,
                          ),
                          const Icon(Icons.arrow_drop_down_circle_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(
              child: SingleChildScrollView(
            child: food_page_body(),
          ))
        ],
      ),
    );
  }
}
