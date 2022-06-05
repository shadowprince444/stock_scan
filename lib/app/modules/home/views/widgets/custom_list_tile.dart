import 'package:flutter/material.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';
import 'package:stock_scan/utils/screen_utils/widgets/spacing_widgets.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key, required this.title, required this.subTitle, required this.titleTextStyle, required this.subTitleTextStyle}) : super(key: key);
  final String title, subTitle;
  final TextStyle titleTextStyle, subTitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.hdp(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            height: 5.vdp(),
            width: 5.vdp(),
          ),
          const HSpace(16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.vdp(),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: titleTextStyle,
                  ),
                  Text(
                    subTitle,
                    style: subTitleTextStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
