import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/constants/assets_constants.dart';
import 'package:twitter_clone/constants/ui_constants.dart';
import 'package:twitter_clone/features/tweet/views/create_tweet_view.dart';
import 'package:twitter_clone/theme/pallete.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeView());

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _pageIndex = 0;
  final _appBar = UIConstants.appBar();

  void onPageChange(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void onCreatetweet() {
    Navigator.push(context, CreateTweetScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: IndexedStack(
        index: _pageIndex,
        children: UIConstants.bottomTabBarPages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreatetweet,
        child: const Icon(
          Icons.add,
          color: Pallete.whiteColor,
          size: 28,
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Pallete.backgroundColor,
        currentIndex: _pageIndex,
        onTap: onPageChange,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _pageIndex == 0
                  ? AssetsConstants.homeFilledIcon
                  : AssetsConstants.homeOutlinedIcon,
              color: Pallete.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.searchIcon,
              color: Pallete.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _pageIndex == 2
                  ? AssetsConstants.notifFilledIcon
                  : AssetsConstants.notifOutlinedIcon,
              color: Pallete.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
