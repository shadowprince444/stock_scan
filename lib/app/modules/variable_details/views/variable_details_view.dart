import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_scan/app/enums/app_enums.dart';
import 'package:stock_scan/app/modules/variable_details/views/widgets/indicator_variable_details_widget.dart';
import 'package:stock_scan/app/modules/variable_details/views/widgets/variable_value_tile.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/screen_utils/widgets/responsive_safe_area.dart';
import 'package:stock_scan/utils/theme/text_themes.dart';

import '../controllers/variable_details_controller.dart';

class VariableDetailsView extends GetView<VariableDetailsController> {
  const VariableDetailsView({Key? key}) : super(key: key);

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
              child: SingleChildScrollView(
                child: controller.variable.type == VariableType.value
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.variable.valueList!.values.length,
                        itemBuilder: (context, index) {
                          return VariableValueTile(
                            value: controller.variable.valueList!.values[index].toString(),
                          );
                        })
                    : controller.variable.type == VariableType.indicator
                        ? IndicatorVariableDetailsWidget(controller: controller)
                        : Padding(
                            padding: EdgeInsets.all(
                              8.vdp(),
                            ),
                            child: Text(
                              "Undefined Variable",
                              style: AppTextThemes().headline2,
                            ),
                          ),
              ),
            );
          },
        ));
  }
}
