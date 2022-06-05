import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/theme/text_themes.dart';

buildSnackBar(String message, String title) {
  Get.snackbar(
    title,
    "",
    messageText: Text(
      message,
      style: AppTextThemes().bodyText1.copyWith(
            color: Colors.white,
          ),
      maxLines: 4,
    ),
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    isDismissible: false,
    duration: Duration(minutes: 1),
    margin: EdgeInsets.symmetric(
      vertical: SizeConfig.getBottomScreenPadding() + 80.vdp(),
      horizontal: 24.hdp(),
    ),
    mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Icon(
          Icons.close,
          color: Colors.white,
        )),
    boxShadows: [
      BoxShadow(
        color: Colors.white24,
        offset: Offset(4, 4.vdp()),
        blurRadius: 4.vdp(),
      )
    ],
    backgroundColor: Colors.grey,
  );
}
