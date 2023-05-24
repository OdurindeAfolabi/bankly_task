import 'dart:developer';

import 'package:bankly_task/core/service/service_entrypoint.dart';

import '../../utils/http/paths.dart';
import '../../utils/internet_checker.dart';
import '../models/error_model.dart';
import '../models/success_model.dart';

class TransactionService{
  ///get all customer contacts
  getAllTransactions() async {
    if (await checkInternetConnectivity()){
      try {
        final result = await http.get(Paths.fetchTransactions);
        if (result is ErrorModel) {
          log("ERROR");
          log(result.error);
          return ErrorModel(result.error);
        }
        log("RESULT");
        return SuccessModel(result.data);
      } catch (e) {
        log(e.toString());
        return ErrorModel(e.toString() ==
            "SocketException: Failed host lookup: $baseUrlError"
            ? "We can't reach our servers at the moment"
            : e.toString() == "TimeoutException after 0:00:40.000000: Future not completed"
            ? "Your internet is not stable kindly reconnect and try again"
            : e.toString());
      }
    }
    else{
      return ErrorModel("Your internet is not stable kindly reconnect and try again");
    }
  }
}