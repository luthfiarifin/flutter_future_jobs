import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/theme.dart';
import 'package:flutter_future_jobs/widgets/job_title.dart';

class CategoryPage extends StatelessWidget {
  final String jobTitle;
  final String imagePath;

  const CategoryPage({this.jobTitle, this.imagePath, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        height: 270,
        padding: EdgeInsets.only(
          left: defaultMargin,
          bottom: 30,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              imagePath,
            ),
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobTitle,
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              '12,309 available',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      );
    }

    Widget bigCompanies() {
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Big Companies',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            JobTitle(
              jobTitle: 'Front-End Developer',
              companyName: 'Google',
              companyLogo: 'assets/icon_google.png',
            ),
            JobTitle(
              jobTitle: 'UI Designer',
              companyName: 'Instagram',
              companyLogo: 'assets/icon_instagram.png',
            ),
            JobTitle(
              jobTitle: 'Data Scientist',
              companyName: 'Facebook',
              companyLogo: 'assets/icon_facebook.png',
            )
          ],
        ),
      );
    }

    Widget newStartups() {
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Startups',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            JobTitle(
              jobTitle: 'Front-End Developer',
              companyName: 'Google',
              companyLogo: 'assets/icon_google.png',
            ),
            JobTitle(
              jobTitle: 'UI Designer',
              companyName: 'Instagram',
              companyLogo: 'assets/icon_instagram.png',
            ),
            JobTitle(
              jobTitle: 'Data Scientist',
              companyName: 'Facebook',
              companyLogo: 'assets/icon_facebook.png',
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            bigCompanies(),
            newStartups(),
          ],
        ),
      ),
    );
  }
}
