import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherProfileDetailsScreen extends StatefulWidget {
	final int index;
  const OtherProfileDetailsScreen(this.index, {super.key});

  @override
  State<OtherProfileDetailsScreen> createState() => _OtherProfileDetailsScreenState();
}

class _OtherProfileDetailsScreenState extends State<OtherProfileDetailsScreen> {
  int numberPhotos = 4;
	int currentPhoto = 0;

	@override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: Theme.of(context).colorScheme.background,
			body: SafeArea(
				child: Stack(
					alignment: Alignment.bottomCenter,
					children: [
						SingleChildScrollView(
							child: Padding(
								padding: const EdgeInsets.only(bottom: 50.0),
								child: Column(
									children: [
										Container(
											width: MediaQuery.of(context).size.width,
											height: MediaQuery.of(context).size.height * 0.6,
											child: Hero(
												tag: "imageTag${widget.index}",
												child: Stack(
													children: [
														Container(
															width: MediaQuery.of(context).size.width,
															height: (MediaQuery.of(context).size.height * 0.6) - 25,
															decoration: const BoxDecoration(
																image: DecorationImage(
																	fit: BoxFit.cover,
																	image: AssetImage(
																		"assets/girl.png"
																	)
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
																		width: MediaQuery.of(context).size.width,
																		height: (MediaQuery.of(context).size.height * 0.6) - 25,
																			decoration: const BoxDecoration(
																				color: Colors.transparent
																			),
																		),
																	),
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
																		width: MediaQuery.of(context).size.width,
																		height: (MediaQuery.of(context).size.height * 0.6) - 25,
																			decoration: const BoxDecoration(
																				color: Colors.transparent
																			),
																		),
																	),
																),
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
																					width: ((MediaQuery.of(context).size.width - (20 + ((numberPhotos+ 1) * 8))) / numberPhotos),
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
														Align(
															alignment: Alignment.bottomRight,
															child: Padding(
																padding: const EdgeInsets.only(right: 16),
																child: Material(
																	color: Theme.of(context).colorScheme.primary,
																	elevation: 3,
																	borderRadius: BorderRadius.circular(100),
																	child: InkWell(
																		borderRadius: BorderRadius.circular(100),
																		onTap: () {
																			Navigator.pop(context);
																		}, 
																		child: Container(
																			height: 50,
																			width: 50,
																			decoration: const BoxDecoration(
																				shape: BoxShape.circle,
																			),
																			child: Center(
																				child: Padding(
																					padding: const EdgeInsets.all(8.0),
																					child: Image.asset(
																						'assets/icons/arrow_down.png',
																						scale: 20,
																						color: Colors.white,
																						fit: BoxFit.cover,
																					),
																				)
																			),
																		)
																	),
																),
															),
														),
													],
												),
											),
										),
										Column(
											mainAxisAlignment: MainAxisAlignment.end,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												const Padding(
													padding: EdgeInsets.fromLTRB(16, 0, 16, 5),
													child: Row(
														children: [
															Text(
															"Liz",
															style: TextStyle(
																color: Colors.black,
																fontWeight: FontWeight.w600,
																fontSize: 25
															),
														),
														SizedBox(width: 5,),
														Text(
															"25",
															style: TextStyle(
																color: Colors.black,
																fontWeight: FontWeight.w300,
																fontSize: 25
															),
														),
														],
													),
												),
												Padding(
													padding: const EdgeInsets.symmetric(horizontal: 16),
													child: Row(
														children: [
															Icon(
																CupertinoIcons.placemark,
																color: Colors.grey.shade600,
																size: 15,
															),
															const SizedBox(width: 5,),
															Text(
																"25 km away",
																style: TextStyle(
																	color: Colors.grey.shade600,
																	fontWeight: FontWeight.w300,
																	fontSize: 15
																),
															),
														],
													),
												),
												Padding(
													padding: const EdgeInsets.symmetric(vertical: 16),
													child: Divider(
														color: Colors.grey.shade600,
													),
												),
												const Padding(
													padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
													child: Text(
														"About Me",
														style: TextStyle(
															color: Colors.black,
															fontWeight: FontWeight.w600,
															fontSize: 16
														),
													),
												),
												Padding(
													padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
													child: Text(
														"blabalbalblal\nbalbafzegzegizrio\ngnzgzuegfefzefhiuzehfzuehfuzefizehfozehofze\nzegfzeoifgjziejifnze",
														style: TextStyle(
															color: Colors.grey.shade600,
														),
													),
												),
												Padding(
													padding: const EdgeInsets.symmetric(vertical: 16),
													child: Divider(
														color: Colors.grey.shade600,
													),
												),
											],
										)
									],
								),
							),
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Material(
									color: Colors.white,
									elevation: 3,
									borderRadius: BorderRadius.circular(100),
									child: InkWell(
										splashColor: Colors.red,
										borderRadius: BorderRadius.circular(100),
										onTap: () {
											// _matchEngine.currentItem!.nope();
										}, 
										child: Container(
											height: 60,
											width: 60,
											decoration: const BoxDecoration(
												shape: BoxShape.circle,
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
								const SizedBox(width: 20,),
								Material(
									color: Colors.white,
									elevation: 3,
									borderRadius: BorderRadius.circular(100),
									child: InkWell(
										splashColor: Colors.lightBlue,
										borderRadius: BorderRadius.circular(100),
										onTap: () {
											// _matchEngine.currentItem!.superLike();
										}, 
										child: Container(
											height: 50,
											width: 50,
											decoration: const BoxDecoration(
												shape: BoxShape.circle,
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
								const SizedBox(width: 20,),
								Material(
									color: Colors.white,
									elevation: 3,
									borderRadius: BorderRadius.circular(100),
									child: InkWell(
										onTap: () {
											// _matchEngine.currentItem!.like();
										}, 
										splashColor: Colors.greenAccent,
										borderRadius: BorderRadius.circular(100),
										child: Container(
											height: 60,
											width: 60,
											decoration: const BoxDecoration(
												shape: BoxShape.circle,
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
							],
						)
					],
				)
			),
		);
  }
}