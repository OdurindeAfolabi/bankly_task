
import 'package:bankly_task/core/models/transaction_response_model.dart';
import 'package:bankly_task/presentation/screens/transaction_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/assets_manager.dart';
import '../../../../../utils/colors.dart';
import '../../utils/screensize.dart';
import '../widgets/transaction_item_widget.dart';
class CreditTransactionView extends StatefulWidget {
  final List<TransactionResponseModel> creditTransactions;
  const CreditTransactionView({Key? key, required this.creditTransactions}) : super(key: key);

  @override
  State<CreditTransactionView> createState() => _CreditTransactionViewState();
}

class _CreditTransactionViewState extends State<CreditTransactionView> {

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.creditTransactions.length);
    }
    return ListView(
      children: [
        const SizedBox(height: 10,),
        widget.creditTransactions.isEmpty ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Responsive.heightSizer(40, context),),
              SvgPicture.asset(ImageAssets.banklyLogo,width: 100,height: 100,),
              SizedBox(height: Responsive.heightSizer(40, context),),
              Text("No credit transactions",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.black,fontSize: 14,fontWeight: FontWeight.w500),),
            ],
          ),
        ) :
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.creditTransactions.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransactionDetailsView(
                          transactionDetails: widget.creditTransactions[index],
                        )));
                  },
                  child: TransactionItemWidget(transactionDetails: widget.creditTransactions[index],)
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
