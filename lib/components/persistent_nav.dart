import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../blocs/authentication_bloc/authentication_bloc.dart';
import '../screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../screens/home/views/home_screen.dart';
import '../screens/profile/views/profile_screen.dart';

class PersistentTabScreen extends StatefulWidget {
  const PersistentTabScreen({super.key});

  @override
  State<PersistentTabScreen> createState() => _PersistentTabScreenState();
}

class _PersistentTabScreenState extends State<PersistentTabScreen> {
	final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
	late Color dynamicColor;

	List<Widget> _buildScreens() {
    return [
			const HomeScreen(),
			BlocProvider(
				create: (context) => SignInBloc(
					userRepository: context.read<AuthenticationBloc>().userRepository
				),
				child: const ProfileScreen(),
			)
    ];
  }

	List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
					"assets/tinder_logo.png",
					scale: 16,
					color: dynamicColor,
				),
      ),
			PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_fill, size: 30,),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

	@override
  void initState() {
    dynamicColor = const Color(0xFFFe3c72);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
			context, 
			controller: _controller,
			screens: _buildScreens(),
			items: _navBarsItems(),
			onItemSelected: (value) {
			  if(value == 0) {
					setState(() {
					  dynamicColor = Theme.of(context).colorScheme.primary;
					});
				} else {
					setState(() {
					  dynamicColor = Colors.grey;
					});
				}
			},
			confineInSafeArea: true,
			backgroundColor: Theme.of(context).colorScheme.background, // Default is Colors.white.
			handleAndroidBackButtonPress: true, // Default is true.
			resizeToAvoidBottomInset:true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
			stateManagement: true, // Default is true.
			hideNavigationBarWhenKeyboardShows:true,
			decoration: NavBarDecoration(
				border: Border(
					top: BorderSide(
						color: Colors.grey.shade300,
						width: 2
					),
				),
				colorBehindNavBar: Colors.white,
			),
			popAllScreensOnTapOfSelectedTab: true,
			popActionScreens: PopActionScreensType.all,
			itemAnimationProperties: const ItemAnimationProperties(
				// Navigation Bar's items animation properties.
				duration: Duration(milliseconds: 200),
				curve: Curves.ease,
			),
			screenTransitionAnimation: const ScreenTransitionAnimation(
				// Screen transition animation on change of selected tab.
				animateTabTransition: true,
				curve: Curves.ease,
				duration: Duration(milliseconds: 200),
			),
			navBarStyle: NavBarStyle.style8,
		);
  }
}