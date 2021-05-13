import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/category_model.dart';
import 'package:flutter_future_jobs/models/job_model.dart';
import 'package:flutter_future_jobs/providers/category_provider.dart';
import 'package:flutter_future_jobs/providers/job_provider.dart';
import 'package:flutter_future_jobs/providers/user_provider.dart';
import 'package:flutter_future_jobs/widgets/category_card.dart';
import 'package:flutter_future_jobs/widgets/job_title.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  userProvider.user.name,
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                )
              ],
            ),
            Container(
              width: 58,
              height: 58,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryColor)),
              child: Image.asset(
                'assets/image_profile.png',
              ),
            )
          ],
        ),
      );
    }

    Widget hotCategories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Hot Categories',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 200,
            child: FutureBuilder<List<CategoryModel>>(
              future: categoryProvider.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  int index = -1;

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.map((category) {
                      index++;

                      return Container(
                        margin: EdgeInsets.only(
                          left: index == 0 ? defaultMargin : 0,
                        ),
                        child: CategoryCard(
                          jobTitle: category.name,
                          imagePath: category.imageUrl,
                        ),
                      );
                    }).toList(),
                    // [
                    //   CategoryCard(
                    //     jobTitle: 'Web Developer',
                    //     imagePath: 'assets/image_category1.png',
                    //   ),
                    //   CategoryCard(
                    //     jobTitle: 'Mobile Developer',
                    //     imagePath: 'assets/image_category2.png',
                    //   ),
                    //   CategoryCard(
                    //     jobTitle: 'App Designer',
                    //     imagePath: 'assets/image_category3.png',
                    //   ),
                    //   CategoryCard(
                    //     jobTitle: 'Content Writer',
                    //     imagePath: 'assets/image_category4.png',
                    //   ),
                    //   CategoryCard(
                    //     jobTitle: 'Video Grapher',
                    //     imagePath: 'assets/image_category5.png',
                    //   ),
                    //   SizedBox(
                    //     width: defaultMargin,
                    //   ),
                    // ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      );
    }

    Widget justPosted() {
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
              'Just Posted',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
                future: jobProvider.getJobs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: snapshot.data
                          .map((job) => JobTitle(
                                jobTitle: job.name,
                                companyName: job.companyName,
                                companyLogo: job.companyLogo,
                              ))
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
            // JobTitle(
            //   jobTitle: 'Front-End Developer',
            //   companyName: 'Google',
            //   companyLogo: 'assets/icon_google.png',
            // ),
            // JobTitle(
            //   jobTitle: 'UI Designer',
            //   companyName: 'Instagram',
            //   companyLogo: 'assets/icon_instagram.png',
            // ),
            // JobTitle(
            //   jobTitle: 'Data Scientist',
            //   companyName: 'Facebook',
            //   companyLogo: 'assets/icon_facebook.png',
            // )
          ],
        ),
      );
    }

    Widget body() {
      return ListView(
        children: [
          header(),
          hotCategories(),
          justPosted(),
        ],
      );
    }

    Widget bottomNavBar() {
      return BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_home.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_notification.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_love.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_user.png',
              width: 24,
            ),
            label: '',
          ),
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: body(),
    );
  }
}
