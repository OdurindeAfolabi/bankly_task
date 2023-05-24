
import 'package:bankly_task/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/screensize.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({
    key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            ImageAssets.errorImage,
            width: Responsive.screenWidth(context) / 2.5,
            color: AppColors.banklyBlue.withOpacity(0.6),
          ),
          Text(
            'Oh no!',
            style: TextStyle(
              color: AppColors.banklyRed,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: AppColors.banklyRed,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(2.0),
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.white,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(
                    color: AppColors.banklyBlue,
                  ),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 10.0,
              ),
              child: Text(
                "Retry",
                style: TextStyle(
                  color: AppColors.banklyBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
