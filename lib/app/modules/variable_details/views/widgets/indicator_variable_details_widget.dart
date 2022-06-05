import 'package:flutter/material.dart';
import 'package:stock_scan/app/modules/variable_details/controllers/variable_details_controller.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/screen_utils/widgets/spacing_widgets.dart';
import 'package:stock_scan/utils/theme/text_themes.dart';

class IndicatorVariableDetailsWidget extends StatelessWidget {
  const IndicatorVariableDetailsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VariableDetailsController controller;

  @override
  Widget build(BuildContext context) {
    var indicate = controller.variable.indicators;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.hdp(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(8),
          Text(
            indicate!.studyType.toUpperCase(),
            style: AppTextThemes().headline4,
          ),
          const VSpace(8),
          Text(
            "Set Parameters",
            style: AppTextThemes().headline3.copyWith(
                  fontStyle: FontStyle.normal,
                ),
          ),
          const VSpace(8),
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: 140.vdp(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.hdp(),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      indicate!.parameterName,
                      style: AppTextThemes().bodyText2.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const HSpace(16),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: const UnderlineInputBorder(),
                        ),
                        initialValue: indicate!.defaultValue.toString(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
