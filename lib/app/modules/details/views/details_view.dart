import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_scan/app/enums/app_enums.dart';
import 'package:stock_scan/app/modules/details/views/widgets/criteria_widget.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/screen_utils/widgets/responsive_safe_area.dart';
import 'package:stock_scan/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:stock_scan/utils/theme/text_themes.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80.vdp(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.hdp(),
                  ),
                  color: Colors.blue.shade800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VSpace(8),
                      Text(
                        controller.stockModel.name,
                        style: AppTextThemes().headline2.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        controller.stockModel.tag,
                        style: AppTextThemes().bodyText2.copyWith(
                              color: controller.stockModel.color,
                            ),
                      ),
                      const VSpace(8),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hdp()),
                  child: ListView.separated(
                    itemCount: controller.stockModel.criteria.length,
                    itemBuilder: (context, index) {
                      final criteria = controller.stockModel.criteria[index];
                      if (criteria.type == CriteriaType.variable) {
                        return CriteriaWidget(
                          criteria: criteria,
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.vdp(),
                          ),
                          child: Text(
                            criteria.text,
                            style: AppTextThemes().headline2,
                          ),
                        );
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Text(
                        "and",
                        style: AppTextThemes().headline1,
                      );
                    },
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
