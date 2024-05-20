import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/App_column.dart';
import 'package:food_delivery/widgets/BigText.dart';
import 'package:food_delivery/widgets/Icon_and_Text_Widgets.dart';
import 'package:food_delivery/widgets/SmallText.dart';
import 'package:food_delivery/utils/dimensions.dart';

class food_page_body extends StatefulWidget {
  const food_page_body({super.key});

  @override
  State<food_page_body> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<food_page_body> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          child: SizedBox(
            //color:  Colors.blueAccent,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _BuildPageItem(position);
                }),
          ),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.height10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.height10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Daftar Makanan",
                  color: Color.fromARGB(255, 132, 136, 136),
                ),
              )
            ],
          ),
        ),
        //list food and images
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/image/american-shrimp-fried-rice.jpg"))),
                    ),
                    //text container
                    Expanded(
                        child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                                text: "Soto Betawi Khas Jakarta Kelapa Gading"),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            SmallText(text: "Dimasak dengan santen"),
                            SizedBox(height: Dimensions.height10),
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
                                    text: "comments",
                                    color: Color.fromARGB(255, 132, 136, 136))
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
                        ),
                      ),
                    )),
                  ],
                ),
              );
            })
      ],
    );
  }

  Widget _BuildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 2) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.height10, right: Dimensions.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven
                      ? const Color(0XFF69C5DF)
                      : const Color(0xFF9294cc),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/image/american-shrimp-fried-rice.jpg"))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    ]),
                child: Container(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 15,
                      right: 15,
                    ),
                    child: AppColumn(
                      text: "Nasi Goreng Seafood",
                    )),
              ),
            ),
          ],
        ));
  }
}
