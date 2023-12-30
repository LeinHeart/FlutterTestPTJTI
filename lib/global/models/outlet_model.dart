class Outlet {
  String id;
  String outletName;
  String outletCode;
  String outletAddress;
  String outletPhone;
  String invoicePrint;
  String startingDate;
  String invoiceFooter;
  String dateFormat;
  String timeZone;
  String currency;
  String currencyShow;
  String decimalShow;
  String decimalDigit;
  String decimalZeroHide;
  String outletMode;
  String showIngCode;
  String hppMode;
  String cekAksesBydb;
  String collectTax;
  String taxRegistrationTitle;
  String taxRegistrationNo;
  String taxTitle;
  String taxUseGlobal;
  String taxIsGst;
  String stateCode;
  String preOrPostPayment;
  String userId;
  String parentId;
  String orderId;
  String maxSub;
  String delStatus;

  List<SubOutlet> outletSubs;

  Outlet({
    required this.id,
    required this.outletName,
    required this.outletCode,
    required this.outletAddress,
    required this.outletPhone,
    required this.invoicePrint,
    required this.startingDate,
    required this.invoiceFooter,
    required this.dateFormat,
    required this.timeZone,
    required this.currency,
    required this.currencyShow,
    required this.decimalShow,
    required this.decimalDigit,
    required this.decimalZeroHide,
    required this.outletMode,
    required this.showIngCode,
    required this.hppMode,
    required this.cekAksesBydb,
    required this.collectTax,
    required this.taxRegistrationTitle,
    required this.taxRegistrationNo,
    required this.taxTitle,
    required this.taxUseGlobal,
    required this.taxIsGst,
    required this.stateCode,
    required this.preOrPostPayment,
    required this.userId,
    required this.parentId,
    required this.orderId,
    required this.maxSub,
    required this.delStatus,
    required this.outletSubs,
  });

  factory Outlet.fromJson(Map<String, dynamic> json) {
    List<SubOutlet> subOutlets = [];
    if (json['outlet_subs'] != null) {
      subOutlets = List<SubOutlet>.from(
        json['outlet_subs'].map(
          (subJson) => SubOutlet.fromJson(subJson),
        ),
      );
    }

    return Outlet(
      id: json['outlet']['id'],
      outletName: json['outlet']['outlet_name'],
      outletCode: json['outlet']['outlet_code'],
      outletAddress: json['outlet']['outlet_address'],
      outletPhone: json['outlet']['outlet_phone'],
      invoicePrint: json['outlet']['invoice_print'],
      startingDate: json['outlet']['starting_date'],
      invoiceFooter: json['outlet']['invoice_footer'],
      dateFormat: json['outlet']['date_format'],
      timeZone: json['outlet']['time_zone'],
      currency: json['outlet']['currency'],
      currencyShow: json['outlet']['currency_show'],
      decimalShow: json['outlet']['decimal_show'],
      decimalDigit: json['outlet']['decimal_digit'],
      decimalZeroHide: json['outlet']['decimal_zero_hide'],
      outletMode: json['outlet']['outlet_mode'],
      showIngCode: json['outlet']['show_ing_code'],
      hppMode: json['outlet']['hpp_mode'],
      cekAksesBydb: json['outlet']['cek_akses_bydb'],
      collectTax: json['outlet']['collect_tax'],
      taxRegistrationTitle: json['outlet']['tax_registration_title'],
      taxRegistrationNo: json['outlet']['tax_registration_no'],
      taxTitle: json['outlet']['tax_title'],
      taxUseGlobal: json['outlet']['tax_use_global'],
      taxIsGst: json['outlet']['tax_is_gst'],
      stateCode: json['outlet']['state_code'],
      preOrPostPayment: json['outlet']['pre_or_post_payment'],
      userId: json['outlet']['user_id'],
      parentId: json['outlet']['parent_id'],
      orderId: json['outlet']['order_id'],
      maxSub: json['outlet']['max_sub'],
      delStatus: json['outlet']['del_status'],
      outletSubs: subOutlets,
    );
  }
}

class SubOutlet {
  String id;
  String outletName;
  String parentId;
  String orderId;

  SubOutlet({
    required this.id,
    required this.outletName,
    required this.parentId,
    required this.orderId,
  });

  factory SubOutlet.fromJson(Map<String, dynamic> json) {
    return SubOutlet(
      id: json['id'],
      outletName: json['outlet_name'],
      parentId: json['parent_id'],
      orderId: json['order_id'],
    );
  }
}

class OutletListItem {
  String id;
  String outletName;

  OutletListItem({
    required this.id,
    required this.outletName,
  });
}
