import 'package:flutter/material.dart';

//* Pure json ka Model
class DataModel {
  int limit;
  int skip;
  int total;
  List<QuoteModel> quotes;

  DataModel(
      {required this.limit,
      required this.quotes,
      required this.skip,
      required this.total});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<QuoteModel> listQuotes = [];
    for (Map<String, dynamic> eachMap in json['quotes']) {
      var eachQuotes = QuoteModel.fromJson(eachMap);
      listQuotes.add(eachQuotes);
    }
    return DataModel(
        limit: json['limit'],
        quotes: listQuotes,
        skip: json['skip'],
        total: json['total']);
  }
}

//* pure list ka model
class QuoteModel {
  int id;
  String author;
  String quote;

  QuoteModel({required this.id, required this.author, required this.quote});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['id'], author: json['author'], quote: json['quote']);
  }
}
