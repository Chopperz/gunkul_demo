export 'user_model/user_model.dart';
export 'product_model/product_model.dart';

class Paginate<T> {
  final int total;
  final int skip;
  final int limit;
  final List<T> data;

  Paginate({
    this.total = 0,
    this.skip = 0,
    this.limit = 0,
    this.data = const [],
  });

  Paginate<T> copyWith({
    int? total,
    int? skip,
    int? limit,
    List<T>? data,
  }) {
    return Paginate(
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
      data: data ?? this.data,
    );
  }

  factory Paginate.fromJson(Map<String, dynamic> json, {required List<T> cast}) {
    return Paginate<T>(
      total: json["total"]?.toInt() ?? 0,
      skip: json["skip"]?.toInt() ?? 0,
      limit: json["limit"]?.toInt() ?? 0,
      data: cast,
    );
  }
}
