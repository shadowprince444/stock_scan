import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_scan/app/modules/home/views/widgets/custom_list_tile.dart';
import 'package:stock_scan/app/routes/app_pages.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/screen_utils/widgets/responsive_safe_area.dart';
import 'package:stock_scan/utils/theme/text_themes.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => await Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Stock Scan Parser'),
          centerTitle: false,
        ),
        body: ResponsiveSafeArea(
          builder: (context, size) => SizedBox(
            height: size.height,
            width: size.width,
            child: Obx(() {
              if (!controller.isLoading.value) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.stockList.length,
                        separatorBuilder: (context, index) => CustomDivider(
                          height: .5.vdp(),
                          color: Colors.white,
                        ),
                        itemBuilder: (context, index) {
                          final stock = controller.stockList[index];
                          return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAILS,
                                  arguments: [
                                    stock,
                                  ],
                                );
                              },
                              child: CustomListTile(
                                title: stock.name,
                                subTitle: stock.tag,
                                titleTextStyle: AppTextThemes().headline1.copyWith(
                                      color: Colors.white,
                                    ),
                                subTitleTextStyle: AppTextThemes().bodyText2.copyWith(
                                      color: stock.color,
                                    ),
                              ));
                        },
                      ),
                      CustomDivider(
                        height: .5.vdp(),
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: const CircularProgressIndicator(),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.height,
    required this.color,
  }) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: SizedBox(
        height: height,
        width: double.infinity,
      ),
    );
  }
}
