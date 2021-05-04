import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/theme.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Image.asset(
        'assets/on_boarding.png',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fill,
      );
    }

    Widget content() {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Build Your Next\nFuture Career Like\na Master',
                style: whiteTextStyle.copyWith(fontSize: 32),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '18,000 jobs available',
                style: whiteTextStyle.copyWith(fontWeight: light),
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 45,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: purpleTextStyle.copyWith(fontWeight: medium),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      height: 45,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: transparentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66),
                            side: BorderSide(
                              color: whiteColor,
                            ),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          content(),
        ],
      ),
    );
  }
}