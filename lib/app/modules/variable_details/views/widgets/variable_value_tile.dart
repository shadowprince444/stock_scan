import 'package:flutter/material.dart';
import 'package:stock_scan/app/modules/home/views/home_view.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/theme/text_themes.dart';

class VariableValueTile extends StatelessWidget {
  const VariableValueTile({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.vdp(),
            horizontal: 16.hdp(),
          ),
          child: Text(
            value,
            style: AppTextThemes().headline2,
          ),
        ),
        CustomDivider(
          height: .5.vdp(),
          color: Colors.white,
        ),
      ],
    );
  }
}
