import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/category_page.dart';
import 'package:flutter_future_jobs/theme.dart';

class CategoryCard extends StatelessWidget {
  final String jobTitle;
  final String imagePath;

  const CategoryCard({this.jobTitle, this.imagePath, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              jobTitle: this.jobTitle,
              imagePath: this.imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 200,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imagePath,
            ),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Text(
            jobTitle,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
        ),
      ),
    );
  }
}
