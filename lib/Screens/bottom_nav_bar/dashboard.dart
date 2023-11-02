
import 'package:anand_mart/widget/appassets.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart' hide Badge;

import 'package:get/get.dart';

import '../../widget/addsize.dart';
import '../../widget/apptheme.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);


  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  RxString selectedCAt = "".obs;
  RxString price = "".obs;
  RxDouble sliderIndex = (0.0).obs;
  final scrollController = ScrollController();

  // void _scrollListener() {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     nearStoreController
  //         .getData(context: context)
  //         .then((value) => setState(() {}));
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // scrollController.addListener(_scrollListener);
    });
  }
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {

        },
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .03),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * .04,
                      ),
                      SizedBox(
                        height: height * .07,
                        child: TextField(
                          maxLines: 1,
                          controller: searchController,
                          style: const TextStyle(fontSize: 17),
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) => {},
                          decoration: InputDecoration(
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  // Get.to(const SearchScreenData());
                                  FocusManager.instance.primaryFocus!
                                      .unfocus();

                                },
                                icon: const Icon(
                                  Icons.search_rounded,
                                  color: AppTheme.primaryColor,
                                  size: 30,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8))),
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: width * .04),
                              hintText: 'Search Your Groceries',
                              hintStyle: TextStyle(
                                  fontSize: AddSize.font14,
                                  color: AppTheme.blackcolor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (value, _) {
                              sliderIndex.value = value.toDouble();
                            },
                            autoPlayCurve: Curves.ease,
                            height: height * .20),
                        items: List.generate(
                            5,
                                (index) => Container(
                              width: width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * .01),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: AppTheme.backgroundcolor),
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(15),
                                child: Image.asset(AppAssets.slider ,fit: BoxFit.cover,),

                              ),
                            )
                        ),),
                      SizedBox(
                        height: height * .01,
                      ),
                      Obx(() {
                        return Center(
                          child: DotsIndicator(
                            dotsCount:5,
                            position: sliderIndex.value.toInt(),
                            decorator: DotsDecorator(
                              color: Colors
                                  .grey.shade300, // Inactive color
                              activeColor: AppTheme.primaryColor,
                              size: const Size.square(12),
                              activeSize: const Size.square(12),
                            ),
                          ),
                        );
                      }),
                      const Text(
                        'Best Fresh Product',
                        style: TextStyle(
                            color: AppTheme.blackcolor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),






                    ],
                  )



                ],
              )),
        ),
      ),

    );
  }




}
