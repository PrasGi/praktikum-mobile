class FinanceData {
  final String id;
  final String needed;
  final String amount;
  final String userId;
  final String categoryId;
  final String createdAt;
  final String updatedAt;

  FinanceData({
    required this.id,
    required this.needed,
    required this.amount,
    required this.userId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FinanceData.fromJson(Map<String, dynamic> json) {
    return FinanceData(
      id: json['id'],
      needed: json['needed'],
      amount: json['amount'],
      userId: json['user_id'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
