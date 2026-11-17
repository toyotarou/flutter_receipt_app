import '../utility/extensions.dart';

class ReceiptItem {
  ReceiptItem({required this.name, this.quantity, this.unitPrice, required this.price, this.taxRate});

  factory ReceiptItem.fromJson(Map<String, dynamic> json) {
    return ReceiptItem(
      name: json['name']?.toString() ?? '',
      quantity: json['quantity']?.toString().toIntOrNull(),
      unitPrice: json['unit_price']?.toString().toIntOrNull(),
      price: json['price']?.toString().toInt() ?? 0,
      taxRate: json['tax_rate']?.toString().toIntOrNull(),
    );
  }

  final String name;
  final int? quantity;
  final int? unitPrice;
  final int price;
  final int? taxRate;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'unit_price': unitPrice,
      'price': price,
      'tax_rate': taxRate,
    };
  }
}

class ReceiptChecks {
  ReceiptChecks({
    required this.itemsSum,
    required this.subtotalOk,
    required this.totalOk,
    required this.lineErrors,
    this.itemCountOk,
  });

  factory ReceiptChecks.fromJson(Map<String, dynamic> json) {
    // ignore: always_specify_types
    final rawLineErrors = json['line_errors'];
    return ReceiptChecks(
      itemsSum: json['items_sum']?.toString().toInt() ?? 0,
      subtotalOk: json['subtotal_ok'] == true,
      totalOk: json['total_ok'] == true,
      lineErrors: rawLineErrors is List
          // ignore: always_specify_types
          ? rawLineErrors.map((e) => e?.toString().toIntOrNull()).whereType<int>().toList()
          : <int>[],
      itemCountOk: json['item_count_ok'] is bool ? json['item_count_ok'] as bool : null,
    );
  }

  final int itemsSum;
  final bool subtotalOk;
  final bool totalOk;
  final List<int> lineErrors;
  final bool? itemCountOk;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'items_sum': itemsSum,
      'subtotal_ok': subtotalOk,
      'total_ok': totalOk,
      'line_errors': lineErrors,
      'item_count_ok': itemCountOk,
    };
  }
}

class Receipt {
  Receipt({
    this.storeName,
    this.date,
    this.time,
    required this.items,
    this.itemCount,
    this.subtotal,
    this.tax,
    this.discount,
    this.total,
    this.paymentMethod,
    this.checks,
    required this.needsCheck,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) {
    // ignore: always_specify_types
    final rawItems = json['items'];
    // ignore: always_specify_types
    final rawChecks = json['checks'];
    return Receipt(
      storeName: json['store_name']?.toString(),
      date: json['date']?.toString(),
      time: json['time']?.toString(),
      items: rawItems is List
          ? rawItems.whereType<Map<String, dynamic>>().map(ReceiptItem.fromJson).toList()
          : <ReceiptItem>[],
      itemCount: json['item_count']?.toString().toIntOrNull(),
      subtotal: json['subtotal']?.toString().toIntOrNull(),
      tax: json['tax']?.toString().toIntOrNull(),
      discount: json['discount']?.toString().toIntOrNull(),
      total: json['total']?.toString().toIntOrNull(),
      paymentMethod: json['payment_method']?.toString(),
      checks: rawChecks is Map<String, dynamic> ? ReceiptChecks.fromJson(rawChecks) : null,
      needsCheck: json['needs_check'] == true,
    );
  }

  final String? storeName;
  final String? date;
  final String? time;
  final List<ReceiptItem> items;
  final int? itemCount;
  final int? subtotal;
  final int? tax;
  final int? discount;
  final int? total;
  final String? paymentMethod;
  final ReceiptChecks? checks;
  final bool needsCheck;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'store_name': storeName,
      'date': date,
      'time': time,
      'items': items.map((ReceiptItem e) => e.toJson()).toList(),
      'item_count': itemCount,
      'subtotal': subtotal,
      'tax': tax,
      'discount': discount,
      'total': total,
      'payment_method': paymentMethod,
      'checks': checks?.toJson(),
      'needs_check': needsCheck,
    };
  }
}
