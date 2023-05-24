import 'package:bankly_task/core/models/transaction_response_model.dart';
import 'package:bankly_task/presentation/screens/transaction_details.dart';
import 'package:bankly_task/utils/screensize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/assets_manager.dart';
import '../../../../../utils/colors.dart';
import '../widgets/transaction_item_widget.dart';
class AllTransactionView extends StatefulWidget {
  final List<TransactionResponseModel> allTransactions;
  const AllTransactionView({Key? key, required this.allTransactions}) : super(key: key);

  @override
  State<AllTransactionView> createState() => _AllTransactionViewState();
}

class _AllTransactionViewState extends State<AllTransactionView> {

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.allTransactions.length);
    }
    return ListView(
      children: [
        const SizedBox(height: 10,),
        widget.allTransactions.isEmpty ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Responsive.heightSizer(40, context),),
              SvgPicture.asset(ImageAssets.banklyLogo,width: 100,height: 100,),
              SizedBox(height: Responsive.heightSizer(40, context),),
              Text("No transactions",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.black,fontSize: 14,fontWeight: FontWeight.w500),),
            ],
          ),
        ) :
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.allTransactions.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TransactionDetailsView(
                        transactionDetails: widget.allTransactions[index],
                      )));
                },
                child: TransactionItemWidget(transactionDetails: widget.allTransactions[index],)
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
