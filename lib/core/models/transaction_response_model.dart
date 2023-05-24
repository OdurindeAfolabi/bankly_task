class TransactionResponseModel {
  TransactionResponseModel({
      this.trnAmount, 
      this.trnCounterPartyService, 
      this.trnDate, 
      this.trnCounterpartyBankCode, 
      this.trnContractReference, 
      this.trnPaymentReference, 
      this.trnCounterPartyReference, 
      this.logourl, 
      this.trnDrCr, 
      this.accountNumber, 
      this.accountName, 
      this.counterPartyAccountNumber, 
      this.counterPartyAccountName, 
      this.journalNarration, 
      this.trnCounterPartyBankName, 
      this.ftCounterPartySwitchCode, 
      this.trnNarration, 
      this.source, 
      this.bankCode, 
      this.branchCode, 
      this.maker, 
      this.checker, 
      this.bankName, 
      this.trnId,});

  TransactionResponseModel.fromJson(dynamic json) {
    trnAmount = json['trnAmount'];
    trnCounterPartyService = json['trnCounterPartyService'];
    trnDate = json['trnDate'];
    trnCounterpartyBankCode = json['trnCounterpartyBankCode'];
    trnContractReference = json['trnContractReference'];
    trnPaymentReference = json['trnPaymentReference'];
    trnCounterPartyReference = json['trnCounterPartyReference'];
    logourl = json['logourl'];
    trnDrCr = json['trnDrCr'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    counterPartyAccountNumber = json['counterPartyAccountNumber'];
    counterPartyAccountName = json['counterPartyAccountName'];
    journalNarration = json['journalNarration'];
    trnCounterPartyBankName = json['trnCounterPartyBankName'];
    ftCounterPartySwitchCode = json['ftCounterPartySwitchCode'];
    trnNarration = json['trnNarration'];
    source = json['source'];
    bankCode = json['bankCode'];
    branchCode = json['branchCode'];
    maker = json['maker'];
    checker = json['checker'];
    bankName = json['bankName'];
    trnId = json['trnId'];
  }
  String? trnAmount;
  String? trnCounterPartyService;
  String? trnDate;
  String? trnCounterpartyBankCode;
  String? trnContractReference;
  String? trnPaymentReference;
  String? trnCounterPartyReference;
  String? logourl;
  String? trnDrCr;
  String? accountNumber;
  String? accountName;
  String? counterPartyAccountNumber;
  String? counterPartyAccountName;
  String? journalNarration;
  String? trnCounterPartyBankName;
  String? ftCounterPartySwitchCode;
  String? trnNarration;
  String? source;
  String? bankCode;
  String? branchCode;
  String? maker;
  String? checker;
  String? bankName;
  String? trnId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trnAmount'] = trnAmount;
    map['trnCounterPartyService'] = trnCounterPartyService;
    map['trnDate'] = trnDate;
    map['trnCounterpartyBankCode'] = trnCounterpartyBankCode;
    map['trnContractReference'] = trnContractReference;
    map['trnPaymentReference'] = trnPaymentReference;
    map['trnCounterPartyReference'] = trnCounterPartyReference;
    map['logourl'] = logourl;
    map['trnDrCr'] = trnDrCr;
    map['accountNumber'] = accountNumber;
    map['accountName'] = accountName;
    map['counterPartyAccountNumber'] = counterPartyAccountNumber;
    map['counterPartyAccountName'] = counterPartyAccountName;
    map['journalNarration'] = journalNarration;
    map['trnCounterPartyBankName'] = trnCounterPartyBankName;
    map['ftCounterPartySwitchCode'] = ftCounterPartySwitchCode;
    map['trnNarration'] = trnNarration;
    map['source'] = source;
    map['bankCode'] = bankCode;
    map['branchCode'] = branchCode;
    map['maker'] = maker;
    map['checker'] = checker;
    map['bankName'] = bankName;
    map['trnId'] = trnId;
    return map;
  }

}