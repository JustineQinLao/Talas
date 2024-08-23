import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talas_app/Pages/MainPages/home.dart';
import 'package:talas_app/Utils/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    initializePreferences();
  }
  void initializePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('started', false);
    prefs.setBool('createdAvatar', false);
  }
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: AppBar(
            backgroundColor: CustomColors.darkbrown,
            leading: Container(),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: CustomColors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(icon: CustomIcons.styledIcon(icon: Icons.home_outlined)),
                Tab(icon: CustomIcons.styledIcon(icon: Icons.mobile_friendly_outlined)),
                Tab(icon: CustomIcons.styledIcon(icon: Icons.info_outline)),
                Tab(icon: CustomIcons.styledIcon(icon: Icons.menu)),
                
              ],
            )
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [

            SingleChildScrollView(child: HomeTab(controllerTab: _tabController,)),  
            SingleChildScrollView(child: Center(child: Text('Guide'))),
            SingleChildScrollView(child: Center(child: Text('About'))),
            SingleChildScrollView(child: Center(child: Text('Menu'))),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}