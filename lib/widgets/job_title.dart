import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/job_model.dart';
import 'package:flutter_future_jobs/pages/detail_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class JobTitle extends StatelessWidget {
  final JobModel job;

  const JobTitle(this.job, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(job),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyLogo,
            width: 44,
          ),
          SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  job.companyName,
                  style: greyTextStyle,
                ),
                SizedBox(
                  height: 18,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
