import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_future_jobs/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      var response =
          await http.get(Uri.parse('https://bwa-jobs.herokuapp.com/jobs'));

      if (response.statusCode == 200) {
        List<JobModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        print(parsedJson);

        parsedJson.forEach((model) {
          print(model);
          categories.add(JobModel.fromJson(model));
        });
        print(categories);

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
