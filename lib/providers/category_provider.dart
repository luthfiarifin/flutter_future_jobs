import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_future_jobs/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http
          .get(Uri.parse('https://bwa-jobs.herokuapp.com/categories'));

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((model) {
          categories.add(CategoryModel.fromJson(model));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
