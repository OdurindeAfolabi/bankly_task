
import 'package:bankly_task/core/models/transaction_response_model.dart';
import 'package:bankly_task/presentation/screens/transaction_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/assets_manager.dart';
import '../../../../../utils/colors.dart';
import '../../utils/screensize.dart';
import '../widgets/transaction_item_widget.dart';
class DebitTransactionView extends StatefulWidget {
  final List<TransactionResponseModel> debitTransactions;
  const DebitTransactionView({Key? key, required this.debitTransactions}) : super(key: key);

  @override
  State<DebitTransactionView> createState() => _DebitTransactionViewState();
}

class _DebitTransactionViewState extends State<DebitTransactionView> {

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.debitTransactions.length);
    }
    return ListView(
      children: [
        const SizedBox(height: 10,),
        widget.debitTransactions.isEmpty ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Responsive.heightSizer(40, context),),
              SvgPicture.asset(ImageAssets.banklyLogo,width: 100,height: 100,),
              SizedBox(height: Responsive.heightSizer(40, context),),
              Text("No debit transactions",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.black,fontSize: 14,fontWeight: FontWeight.w500),),
            ],
          ),
        ) :
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.debitTransactions.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransactionDetailsView(
                          transactionDetails: widget.debitTransactions[index],
                        )));
                  },
                  child: TransactionItemWidget(transactionDetails: widget.debitTransactions[index],)
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 15,color: AppColors.grey2,);
          },
        )
      ],
    );
  }
}
