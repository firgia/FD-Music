library dashboard;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_app/app/constants/app_constant.dart';
import 'package:music_app/app/shared_components/card_music.dart';
import 'package:music_app/app/shared_components/shadow_image.dart';
import 'package:music_app/app/shared_components/sidebar_button.dart';
import 'package:music_app/app/utils/helper/extension.dart';
import 'package:music_app/app/utils/ui/ui_utils.dart';

// bindings
part '../../bindings/dashboard_binding.dart';

// controllers
part '../../controllers/dashboard_controller.dart';
part '../../controllers/dashboard_play_music_controller.dart';

// models
part '../../models/dashboard_album.dart';
part '../../models/dashboard_music.dart';
part '../../models/dashboard_profile.dart';

// components
part '../components/bottom_navbar.dart';
part '../components/header.dart';
part '../components/popular_music.dart';
part '../components/recommended_album.dart';
part '../components/sidebar.dart';
part '../components/top_music.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Responsive(
            mobile: _mobileLayout(),
            tablet: _tabletLayout(),
            desktop: _desktopLayout()),
      ),
      drawer: (!Responsive.isDesktop(context))
          ? Container(
              constraints: BoxConstraints(minHeight: Get.height, maxWidth: 300),
              child: _Sidebar())
          : null,
      bottomNavigationBar: _BottomNavbar(),
    );
  }

  Widget _desktopLayout() {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: _Sidebar(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Flexible(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: Column(
                children: [
                  _Header(),
                  SizedBox(height: kDefaultPadding),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          _TopMusic(),
                          SizedBox(height: kDefaultPadding),
                          Row(
                            children: [
                              Flexible(child: _PopularMusic()),
                              SizedBox(width: kDefaultPadding),
                              Flexible(child: _RecommendedAlbum()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _mobileLayout() {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _Header(
              onTapMenu: () => openDrawer(),
            ),
            SizedBox(height: kDefaultPadding),
            Column(
              children: [
                _TopMusic(),
                SizedBox(height: kDefaultPadding),
                _PopularMusic(),
                SizedBox(height: kDefaultPadding),
                _RecommendedAlbum(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabletLayout() {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          _Header(
            onTapMenu: () => openDrawer(),
          ),
          SizedBox(height: kDefaultPadding),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  _TopMusic(),
                  SizedBox(height: kDefaultPadding),
                  _PopularMusic(),
                  SizedBox(height: kDefaultPadding),
                  _RecommendedAlbum(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void openDrawer() {
    if (_scaffoldKey.currentState != null) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
