import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_scan/app/data/models/stocks_response_model.dart';
import 'package:stock_scan/app/enums/app_enums.dart';
import 'package:stock_scan/app/routes/app_pages.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/theme/text_themes.dart';

class CriteriaWidget extends StatelessWidget {
  final Criteria criteria;

  const CriteriaWidget({Key? key, required this.criteria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = AppTextThemes().headline1;
    TextStyle linkStyle = AppTextThemes().headline1.copyWith(
          color: Colors.blue,
        );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.vdp(),
      ),
      child: RichText(
        text: TextSpan(
          style: defaultStyle,
          children: List.generate(criteria.text.split(" ").length, (index) {
            final splittedText = criteria.text.split(" ")[index];
            if (criteria.variables.map((e) => e.jsonKey).toList().contains(splittedText)) {
              var variable = criteria.variables.firstWhere((element) => element.jsonKey == splittedText);

              return TextSpan(
                  text:
                      "( ${variable.type == VariableType.value ? variable.valueList!.values.first.toString() : variable.type == VariableType.indicator ? variable.indicators!.defaultValue.toString() : "null"} ) ",
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.VARIABLE_DETAILS, arguments: [variable]);
                      print(splittedText);
                    });
            } else {
              return TextSpan(text: "$splittedText ");
            }
          }),
        ),
      ),
    );
  }
}
