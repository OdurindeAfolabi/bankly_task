import 'package:bankly_task/core/models/transaction_response_model.dart';
import 'package:bankly_task/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../../utils/assets_manager.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/screensize.dart';
import '../../utils/date_grouping.dart';
class TransactionItemWidget extends StatelessWidget {
  final TransactionResponseModel transactionDetails;
  const TransactionItemWidget({Key? key, required this.transactionDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(decimalDigits: 2,symbol: "₦");
    final double sWidth = Responsive.screenWidth(context);
    return Container(
      width: sWidth,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              transactionDetails.trnDrCr != "deposit" ?
              SvgPicture.asset(ImageAssets.debitIcon,height: 24,width: 24,) :
              SvgPicture.asset(ImageAssets.creditIcon,height: 24,width: 24,),
              const SizedBox(width: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text((transactionDetails.trnNarration ?? "").addOverFlow,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16, color: AppColors.black2
                      )),
                  const SizedBox(height: 8,),
                  Text(banklyDateTimeFormat(transactionDetails.trnDate ?? DateTime.now().toIso8601String()),style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.dateGrey
                  ))
                ],
              ),
            ],
          ),
          transactionDetails.trnDrCr != "deposit" ?
          Text("-${currencyFormat.format(double.tryParse(transactionDetails.trnAmount ?? "0.0"))}".addOverFlow,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.banklyRed
          )) :
          Text("+${currencyFormat.format(double.tryParse(transactionDetails.trnAmount ?? "0.0"))}".addOverFlow,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.banklyGreen
          ))
        ],
      ),
    );
  }
}
