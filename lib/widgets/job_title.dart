import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/theme.dart';

class JobTitle extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String companyLogo;

  const JobTitle({this.jobTitle, this.companyName, this.companyLogo, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          companyLogo,
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
                jobTitle,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                companyName,
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
    );
  }
}
