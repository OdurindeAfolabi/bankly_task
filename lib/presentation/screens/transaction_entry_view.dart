import 'dart:developer';

import 'package:bankly_task/core/models/transaction_response_model.dart';
import 'package:bankly_task/presentation/screens/credit_transaction_view.dart';
import 'package:bankly_task/presentation/screens/debit_transaction_view.dart';
import 'package:bankly_task/presentation/transaction_view_model.dart';
import 'package:bankly_task/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/view_state.dart';
import '../../utils/screensize.dart';
import '../widgets/loader_widget.dart';
import '../widgets/network_error_screen.dart';
import 'all_transaction_view.dart';
class TransactionEntryView extends StatefulWidget {
  const TransactionEntryView({Key? key}) : super(key: key);

  @override
  State<TransactionEntryView> createState() => _TransactionEntryViewState();
}

class _TransactionEntryViewState extends State<TransactionEntryView> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late  TabController tabController;
  final TextEditingController searchTextController = TextEditingController();
  List<TransactionResponseModel> filteredTransactions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  void _filterItems(String searchText,TransactionViewModel viewModel) {
    log(searchText.replaceAll(" ", ""));
    setState(() {
      filteredTransactions = viewModel.transactionList.where((item) =>
      (item.trnNarration ?? "").toLowerCase().contains(searchText.replaceAll(" ", "").toLowerCase())
      || (item.trnDrCr ?? "").toLowerCase().contains(searchText.replaceAll(" ", "").toLowerCase())
      || (item.trnAmount ?? "").toLowerCase().contains(searchText.replaceAll(" ", "").toLowerCase())
      || (item.accountNumber ?? "").toLowerCase().contains(searchText.replaceAll(" ", "").toLowerCase())
      || (item.bankName ?? "").toLowerCase().contains(searchText.replaceAll(" ", "").toLowerCase()) || (item.trnDrCr ?? "").toLowerCase().contains(searchText.replaceAll(" ", "").toLowerCase())
      ).toList();
    });
  }

  void _resetFilterItems(TransactionViewModel viewModel) {
    setState(() {
      filteredTransactions = viewModel.transactionList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionViewModel>.reactive(
        viewModelBuilder: () => TransactionViewModel(),
        onViewModelReady: (v) async {
          await v.getAllTransactions();
          filteredTransactions = v.transactionList;
        },
        builder: (BuildContext context, TransactionViewModel viewModel, Widget? child) {
          return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {},
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
                    horizontal : 24,vertical: 16
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        controller: searchTextController,
                        onChanged: (value) => _filterItems(value,viewModel),
                        cursorColor: AppColors.banklyBlue,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey3
                          ),
                          suffixIconConstraints:
                          const BoxConstraints(
                              minWidth: 100),
                          suffixIcon:
                          searchTextController.text.isNotEmpty ?
                          IconButton(
                            onPressed: () {
                              searchTextController.clear();
                              _resetFilterItems(viewModel);
                            },
                            icon: Icon(
                              Icons.clear_outlined,
                              color: AppColors.black,
                            ),
                          ) :
                          IconButton(
                            onPressed: () {

                            },
                            icon: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                color: AppColors.banklyBlueLight,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Filter",
                                    style: TextStyle(
                                        color: AppColors.banklyBlue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),),
                                  const SizedBox(width: 6,),
                                  SvgPicture.asset(ImageAssets.filterIcon,height: 10,width: 10,)
                                ],
                              ),
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0),),
                            borderSide: BorderSide(
                                color: AppColors.black2.withOpacity(0.5)),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(ImageAssets.searchIcon),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 3.0,
                              horizontal: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(width: 1, color: AppColors.banklyBlue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Responsive.heightSizer(20, context),),
                    Expanded(
                      child: Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.banklyGrey,
                                        width: 2))),
                            child: TabBar(
                              controller: tabController,
                              isScrollable: false,
                              indicatorColor: AppColors.banklyBlue,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: EdgeInsets.zero,
                              tabs: [
                                Tab(
                                    child: Text("All", style: TextStyle(
                                        color: AppColors.black,
                                      ))),
                                Tab(
                                    child: Text("Credit", style: TextStyle(
                                      color: AppColors.banklyGreen,
                                    ))),
                                Tab(
                                    child: Text("Debit", style: TextStyle(
                                      color: AppColors.banklyRed,
                                    )))
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                _buildAllTransactionSection(viewModel),
                                _buildCreditTransactionSection(viewModel),
                                _buildDebitTransactionSection(viewModel),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
          );
        });
  }

  Widget _buildAllTransactionSection(TransactionViewModel viewModel){
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: LoaderWidget(),
        );
      case ResponseState.COMPLETE:
        return AllTransactionView(allTransactions: filteredTransactions);
      case ResponseState.ERROR:
        return NetworkErrorScreen(
            onPressed: () async {
              await viewModel.getAllTransactions();
              setState(() {
                filteredTransactions = viewModel.transactionList;
              });
            }, title: viewModel.viewState.exception.toString());
      case ResponseState.EMPTY:
        return const SizedBox();
    }
  }

  Widget _buildCreditTransactionSection(TransactionViewModel viewModel){
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: LoaderWidget(),
        );
      case ResponseState.COMPLETE:
        return CreditTransactionView(creditTransactions: filteredTransactions.where((element) => element.trnDrCr == "deposit").toList());
      case ResponseState.ERROR:
        return NetworkErrorScreen(
            onPressed: () async {
              await viewModel.getAllTransactions();
              setState(() {
                filteredTransactions = viewModel.transactionList;
              });
            },title: viewModel.viewState.exception.toString());
      case ResponseState.EMPTY:
        return const SizedBox();
    }
  }

  Widget _buildDebitTransactionSection(TransactionViewModel viewModel){
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: LoaderWidget(),
        );
      case ResponseState.COMPLETE:
        return DebitTransactionView(debitTransactions: filteredTransactions.where((element) => element.trnDrCr != "deposit").toList());
      case ResponseState.ERROR:
        return NetworkErrorScreen(
            onPressed: () async {
              await viewModel.getAllTransactions();
              setState(() {
                filteredTransactions = viewModel.transactionList;
              });
            }, title: viewModel.viewState.exception.toString());
      case ResponseState.EMPTY:
        return const SizedBox();
    }
  }
}
