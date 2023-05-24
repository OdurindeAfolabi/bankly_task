import 'package:bankly_task/core/models/transaction_response_model.dart';
import 'package:bankly_task/core/service/transaction_service.dart';
import 'package:bankly_task/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/models/error_model.dart';
import '../core/models/success_model.dart';
import '../utils/view_state.dart';

class TransactionViewModel extends ChangeNotifier{
  final TransactionService _transactionService = TransactionService();
  List<TransactionResponseModel> transactionList = [];

  ViewState<dynamic> viewState = ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState<dynamic> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  getAllTransactions() async {
    _setViewState(ViewState.loading());
    var result = await _transactionService.getAllTransactions();
    if (result is ErrorModel) {
      Fluttertoast.showToast(
          msg: result.error,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 3,
          gravity: ToastGravity.TOP,
          backgroundColor: AppColors.banklyRed,
          textColor: AppColors.white,
          fontSize: 16);
      _setViewState(ViewState.error(result.error.toString()));
      notifyListeners();
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      _setViewState(ViewState.complete(List<TransactionResponseModel>.from(result.data.map((item) => TransactionResponseModel.fromJson(item)))));
      transactionList = List<TransactionResponseModel>.from(result.data.map((item) => TransactionResponseModel.fromJson(item)));
      notifyListeners();
      return SuccessModel(result.data);
    }
  }
}