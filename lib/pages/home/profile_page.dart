import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';

import '../../models/user_models.dart';
import '../../provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    UserModel userModel = userProvider.user;
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    userModel.profilePhotoUrl,
                    width: 64,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${userModel.name}',
                        style: primaryTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        '@${userModel.username}',
                        style: subtitleTextStyle.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/exit_buttom.png',
                    width: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
          margin: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: subtitleTextStyle.copyWith(fontSize: 13),
              ),
              Icon(
                Icons.chevron_right,
                color: primaryTextColor,
              )
            ],
          ));
    }

    Widget body() {
      return Expanded(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        decoration: BoxDecoration(color: backgroundColor3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Account',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem('Edit Profile')),
            menuItem('Your Orders'),
            menuItem('Help'),
            const SizedBox(
              height: 32,
            ),
            Text(
              'General',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            menuItem('Privacy & Policy'),
            menuItem('Term of Service'),
            menuItem('Rate App'),
          ],
        ),
      ));
    }

    return Column(
      children: [header(), body()],
    );
  }
}
