import 'package:json_annotation/json_annotation.dart';

part "product_model.g.dart";

@JsonSerializable()
class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final num? discountPercentage;
  final num? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String> images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images = const [],
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    num? discountPercentage,
    num? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
