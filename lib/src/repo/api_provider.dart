import 'package:http/http.dart';

import 'dart:convert';

import 'package:news_app/src/core/constant.dart';
import 'package:news_app/src/models/item_models.dart';

class ApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get("$BASE_URL/topstories.json");
    final ids = jsonDecode(response.body);
    return ids;
  }

  fetchItems(int id) async {
    final response = await client.get("$BASE_URL/item/$id.json");
    final parsedJson =jsonDecode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
