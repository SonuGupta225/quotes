import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quotes/model/quote_model.dart';
import 'package:http/http.dart' as httpClient;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? dataModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quotes'),
        ),
        body: dataModel != null && dataModel!.quotes.isNotEmpty
            ? ListView.builder(
                itemCount: dataModel!.quotes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(dataModel!.quotes[index].quote),
                        subtitle: Text(dataModel!.quotes[index].author),
                      ),
                    ),
                  );
                })
            : Container(
                child: Center(
                  child: Text('Fetching quotes'),
                ),
              ));
  }

  void getQuotes() async {
    var uri = Uri.parse('https://dummyjson.com/quotes');
    var response = await httpClient.get(uri);
    print("code : ${response.statusCode}");
    print("body : ${response.body}");

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      dataModel = DataModel.fromJson(mData);
      setState(() {});
      print(dataModel);
    }
  }
}
