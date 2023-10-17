import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import 'other_profile_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	final _controller = PageController(
		initialPage: 0,
	);

	int numberPhotos = 4;
	int currentPhoto = 0;
	late MatchEngine _matchEngine;

	List<SwipeItem> items = [
		SwipeItem(
			content: "Liz",
			likeAction: () {
				log("Like");
			},
			nopeAction: () {
				log("Nope");
			},
			superlikeAction: () {
				log("Superlike");
			},
			onSlideUpdate: (SlideRegion? region) async {
				log("Region $region");
			}
		),
		SwipeItem(
			content: "Liz",
			likeAction: () {
				log("Like");
			},
			nopeAction: () {
				log("Nope");
			},
			superlikeAction: () {
				log("Superlike");
			},
			onSlideUpdate: (SlideRegion? region) async {
				log("Region $region");
			}
		),
		SwipeItem(
			content: "Liz",
			likeAction: () {
				log("Like");
			},
			nopeAction: () {
				log("Nope");
			},
			superlikeAction: () {
				log("Superlike");
			},
			onSlideUpdate: (SlideRegion? region) async {
				log("Region $region");
			}
		),
	];

	@override
  void initState() {
    _matchEngine = MatchEngine(swipeItems: items);
    super.initState();
  }

	@override
	void dispose() {
		_controller.dispose();
		super.dispose();
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: Theme.of(context).colorScheme.background,
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.background,
				elevation: 0,
				title: Row(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Image.asset(
							"assets/tinder_logo.png",
							scale: 18,
						),
						Text(
							'tinder',
							style: TextStyle(
								color: Theme.of(context).colorScheme.primary,
								fontWeight: FontWeight.bold,
								fontSize: 22
							),
						)
					],
				),
			),
			body: SwipeCards(
				matchEngine: _matchEngine,
				upSwipeAllowed: true,
				onStackFinished: () {},
				itemBuilder: (context, i) {
				  return Padding(
						padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
						child: SizedBox(
							width: MediaQuery.of(context).size.width,
							height: MediaQuery.of(context).size.height,
							child: Hero(
								tag: "imageTag$i",
								child: Stack(
									children: [
										Container(
											decoration: BoxDecoration(
												borderRadius: BorderRadius.circular(10),
												image: const DecorationImage(
													fit: BoxFit.cover,
													image: AssetImage(
														"assets/girl.png"
													)
												)
											),
										),
										Container(
											decoration: BoxDecoration(
												borderRadius: BorderRadius.circular(10),
												gradient: const LinearGradient(
													begin: Alignment.bottomCenter,
													end: Alignment.center,
													colors: [
														Colors.black,
														Colors.transparent
													]
												)
											),
										),
										Row(
											children: [
												Expanded(
													child: GestureDetector(
														onTap: () {
														  if(currentPhoto != 0) {
																setState(() {
																  currentPhoto = currentPhoto - 1;
																});
															}
														},
														child: Container(
															color: Colors.transparent,
														),
													)
												),
												Expanded(
													child: GestureDetector(
														onTap: () {
														  if(currentPhoto < (numberPhotos - 1)) {
																setState(() {
																  currentPhoto = currentPhoto + 1;
																});
															}
														},
														child: Container(
															color: Colors.transparent,
														),
													)
												)
											],
										),
										Align(
											alignment: Alignment.topCenter,
											child: Padding(
												padding: const EdgeInsets.only(top: 6.0),
												child: SizedBox(
													width: MediaQuery.of(context).size.width - 20,
													height: 6,
													child: ListView.builder(
														physics: const NeverScrollableScrollPhysics(),
														itemCount: numberPhotos,
														scrollDirection: Axis.horizontal,
														itemBuilder: (context, int i) {
															return Padding(
																padding: const EdgeInsets.only(left: 8.0),
																child: Container(
																	width: ((MediaQuery.of(context).size.width - (20 + ((numberPhotos + 1) * 8))) / numberPhotos),
																	decoration: BoxDecoration(
																		borderRadius: BorderRadius.circular(20),
																		border: Border.all(
																			color: Colors.white,
																			width: 0.5
																		),
																		color: currentPhoto == i
																			? Colors.white
																			: Theme.of(context).colorScheme.secondary.withOpacity(0.5)
																	),
																),
															);
														}
													),
												),
											),
										),
										Padding(
											padding: const EdgeInsets.all(16.0),
											child: Column(
												mainAxisAlignment: MainAxisAlignment.end,
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													Material(
														color: Colors.transparent,
														child: Row(
															mainAxisAlignment: MainAxisAlignment.spaceBetween,
															children: [
																Row(
																	children: [
																		Text(
																			items[i].content,
																			style: const TextStyle(
																				color: Colors.white,
																				fontWeight: FontWeight.bold,
																				fontSize: 25
																			),
																		),
																		const SizedBox(width: 5,),
																		const Text(
																			"25",
																			style: TextStyle(
																				color: Colors.white,
																				fontWeight: FontWeight.w400,
																				fontSize: 25
																			),
																		),
																	],
																),
																IconButton(
																	onPressed: () {
																		pushNewScreen(
																			context, 
																			pageTransitionAnimation: PageTransitionAnimation.slideUp,
																			withNavBar: false,
																			screen: OtherProfileDetailsScreen(i)
																		);
																	}, 
																	icon: const Icon(
																		CupertinoIcons.info_circle_fill,
																		color: Colors.white,
																	)
																)
															],
														),
													),
													const SizedBox(height: 10,),
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceEvenly,
														children: [
															Material(
																color: Colors.transparent,
																child: InkWell(
																	onTap: () {
																	  
																	},
																	splashColor: Colors.orange,
																	borderRadius: BorderRadius.circular(100),
																	child: Container(
																		width: 50,
																		height: 50,
																		decoration: BoxDecoration(
																			shape: BoxShape.circle,
																			border: Border.all(
																				color: Colors.orange
																			)
																		),
																		child: Center(
																			child: Padding(
																				padding: const EdgeInsets.all(8.0),
																				child: Image.asset(
																					'assets/icons/back.png',
																					color: Colors.yellow,
																					fit: BoxFit.cover,
																				),
																			),
																		),
																	),
																),
															),
															Material(
																color: Colors.transparent,
																child: InkWell(
																	splashColor: Colors.red,
																	borderRadius: BorderRadius.circular(100),
																	onTap: () {
																		_matchEngine.currentItem!.nope();
																	}, 
																	child: Container(
																		height: 60,
																		width: 60,
																		decoration: BoxDecoration(
																			shape: BoxShape.circle,
																			border: Border.all(
																				color: Colors.red
																			)
																		),
																		child: Center(
																			child: Padding(
																				padding: const EdgeInsets.all(12.0),
																				child: Image.asset(
																					'assets/icons/clear.png',
																					color: Theme.of(context).colorScheme.primary,
																					fit: BoxFit.cover,
																				),
																			)
																		),
																	)
																),
															),
															Material(
																color: Colors.transparent,
																child: InkWell(
																	splashColor: Colors.lightBlue,
																	borderRadius: BorderRadius.circular(100),
																	onTap: () {
																		_matchEngine.currentItem!.superLike();
																	}, 
																	child: Container(
																		height: 50,
																		width: 50,
																		decoration: BoxDecoration(
																			shape: BoxShape.circle,
																			border: Border.all(
																				color: Colors.lightBlue
																			)
																		),
																		child: Center(
																			child: Padding(
																				padding: const EdgeInsets.all(8.0),
																				child: Image.asset(
																					'assets/icons/star.png',
																					color: Colors.lightBlueAccent,
																					fit: BoxFit.cover,
																				),
																			)
																		),
																	)
																),
															),
															Material(
																color: Colors.transparent,
																child: InkWell(
																	onTap: () {
																		_matchEngine.currentItem!.like();
																	}, 
																	splashColor: Colors.greenAccent,
																	borderRadius: BorderRadius.circular(100),
																	child: Container(
																		height: 60,
																		width: 60,
																		decoration: BoxDecoration(
																			shape: BoxShape.circle,
																			border: Border.all(
																				color: Colors.greenAccent
																			)
																		),
																		child: Center(
																			child: Padding(
																				padding: const EdgeInsets.all(10.0),
																				child: Image.asset(
																					'assets/icons/heart.png',
																					color: Colors.greenAccent,
																					fit: BoxFit.cover,
																				),
																			)
																		),
																	)
																),
															),
															Material(
																color: Colors.transparent,
																child: InkWell(
																	onTap: () {}, 
																	splashColor: Colors.purple,
																	borderRadius: BorderRadius.circular(100),
																	child: Container(
																		height: 50,
																		width: 50,
																		decoration: BoxDecoration(
																			shape: BoxShape.circle,
																			border: Border.all(
																				color: Colors.purple
																			)
																		),
																		child: Center(
																			child: Padding(
																				padding: const EdgeInsets.all(8.0),
																				child: Image.asset(
																					'assets/icons/light.png',
																					color: const Color.fromRGBO(183, 71, 203, 1),
																					fit: BoxFit.cover,
																				),
																			)
																		),
																	)
																),
															),
														],
													)
												],
											),
										)
									],
								),
							),
						),
					);
				},
			),
		);
  }
}