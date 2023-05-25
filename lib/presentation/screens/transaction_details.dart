import 'dart:io';
import 'package:bankly_task/core/models/transaction_response_model.dart';
import 'package:bankly_task/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../utils/assets_manager.dart';
import '../../utils/colors.dart';
import '../../utils/date_grouping.dart';
import '../../utils/screensize.dart';
class TransactionDetailsView extends StatelessWidget {
  final TransactionResponseModel transactionDetails;
  const TransactionDetailsView({Key? key, required this.transactionDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat =
    Platform.isIOS ?
    NumberFormat.currency(decimalDigits: 2,symbol: "₦"):
    NumberFormat.currency(decimalDigits: 2,symbol: "N");
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(ImageAssets.banklyBackButton)),
        title: const Text(
          "Transactions",
        ),
        titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
      body: Container(
        height: Responsive.screenHeight(context),
        padding: const EdgeInsets.symmetric(
            horizontal : 24,vertical: 30
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 74,
              width: 74,
              child: CircleAvatar(
                backgroundColor: AppColors.banklyBlueLight,
                child: SvgPicture.asset(ImageAssets.banklyLogo,height: 40,width: 30,),
              ),
            ),
            SizedBox(height: Responsive.heightSizer(20, context),),
            Text(currencyFormat.format(double.tryParse(transactionDetails.trnAmount ?? "0.0")).addOverFlow,
                textAlign: TextAlign.center,
                style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: AppColors.black2
            )),
            SizedBox(height: Responsive.heightSizer(70, context),),
            Text("Details:",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.black2
                )),
            SizedBox(height: Responsive.heightSizer(20, context),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date and Time",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grey3
                    )),
                Text(banklyDateTimeFormat2(transactionDetails.trnDate ?? DateTime.now().toIso8601String()),style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.black
                ))
              ],
            ),
            Divider(height: 20,color: AppColors.black,thickness: 0.2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reference",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grey3
                    )),
                Row(
                  children: [
                    Text((transactionDetails.trnPaymentReference ?? "").addOverFlow,style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.black
                    )),
                    const SizedBox(width: 10,),
                    InkWell(
                        onTap: (){
                          _copyToClipboard(transactionDetails.trnPaymentReference ?? "");
                        },
                        child: SvgPicture.asset(ImageAssets.copyIcon,height: 20,width: 20,))
                  ],
                )
              ],
            ),
            Divider(height: 20,color: AppColors.black,thickness: 0.2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Type",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grey3
                    )),
                Text(
                    transactionDetails.trnDrCr == "deposit" ?
                    "credit" : "debit",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.black
                ))
              ],
            ),
            Divider(height: 20,color: AppColors.black,thickness: 0.2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Balance",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grey3
                    )),
                Platform.isIOS ?
                Text("₦2,500.00",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.black
                )) :
                Text("N2,500.00",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.black
                ))
              ],
            ),
            Divider(height: 20,color: AppColors.black,thickness: 0.2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Narration",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grey3
                    )),
                SizedBox(
                  width: Responsive.widthSizer(200, context),
                  child: Text(transactionDetails.trnNarration ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.black
                  )),
                )
              ],
            ),
            Divider(height: 20,color: AppColors.black,thickness: 0.2,),
            SizedBox(height: Responsive.heightSizer(100, context),),
            SizedBox(
              height: 56,
              child: ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.banklyBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: Text(
                    "DOWNLOAD RECEIPT",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  )),
            ),
            SizedBox(height: Responsive.heightSizer(24, context),),
            TextButton(
                onPressed: (){

                },
                child: Text("Share With Bankly Assistant",
                  style: TextStyle(
                  color: AppColors.banklyBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              )))
          ],
        )
      ),
    );
  }
  _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Fluttertoast.showToast(
        msg: "Reference copied!",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColors.banklyGreen,
        textColor: AppColors.white,
        fontSize: 16);
  }
}
