import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({super.key});

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
	List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: Theme.of(context).colorScheme.background,
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.background,
				elevation: 0,
				leading: IconButton(
					onPressed: () {
						Navigator.pop(context);
					}, 
				icon: const Icon(CupertinoIcons.clear)),
			),
			body: SizedBox(
				height: MediaQuery.of(context).size.height,
				width: MediaQuery.of(context).size.width,
				child: Padding(
					padding: EdgeInsets.all(20),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						mainAxisAlignment: MainAxisAlignment.start,
						mainAxisSize: MainAxisSize.max,
						children: [
							const Text(
								"Create New",
								style: TextStyle(
									fontSize: 30,
									fontWeight: FontWeight.bold
								),
							),
							const Text(
								"Select a content type",
								style: TextStyle(
									fontWeight: FontWeight.w300
								),
							),
							Expanded(
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										GestureDetector(
											onTap: () async {
											  final ImagePicker picker = ImagePicker();
												final XFile? image = await picker.pickImage(
													source: ImageSource.gallery,
													imageQuality: 80
												);

												if(image != null && mounted) {
													CroppedFile? croppedFile = await ImageCropper().cropImage(
														sourcePath: image.path,
														aspectRatio: const CropAspectRatio(
															ratioX: 9, 
															ratioY: 16
														),
														aspectRatioPresets: [],
														uiSettings: [
															AndroidUiSettings(
																toolbarTitle: 'Cropper',
																toolbarColor: Theme.of(context).colorScheme.primary,
																toolbarWidgetColor:Colors.white,
																initAspectRatio: CropAspectRatioPreset.original,
																lockAspectRatio: false
															),
															IOSUiSettings(
																title: 'Cropper',
															),
														],
													);

													if(croppedFile != null && mounted) {
														setState(() {
														  images.add(croppedFile.path);
														});
														Navigator.pop(context, images);
													}
												}
											},
											child: Container(
												width: double.infinity,
												height: 120,
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(20),
													image: const DecorationImage(
														fit: BoxFit.cover,
														image: AssetImage(
															"assets/pic.png"
														)
													)
												),
												child: const Padding(
													padding: EdgeInsets.only(left: 40),
													child: Column(
														crossAxisAlignment: CrossAxisAlignment.start,
														mainAxisAlignment: MainAxisAlignment.center,
														children: [
															Text(
																"Upload",
																style: TextStyle(
																	color: Colors.white,
																	fontWeight: FontWeight.w500
																),
															),
															Text(
																"Photo",
																style: TextStyle(
																	color: Colors.white,
																	fontWeight: FontWeight.bold,
																	fontSize: 30
																),
															)
														],
													),
												),
											),
										),
										const SizedBox(height: 20,),
										Container(
											width: double.infinity,
											height: 120,
											decoration: BoxDecoration(
												borderRadius: BorderRadius.circular(20),
												image: const DecorationImage(
													fit: BoxFit.cover,
													image: AssetImage(
														"assets/camera.png"
													)
												)
											),
											child: const Padding(
												padding: EdgeInsets.only(left: 40),
												child: Column(
													crossAxisAlignment: CrossAxisAlignment.start,
													mainAxisAlignment: MainAxisAlignment.center,
													children: [
														Text(
															"Capture from",
															style: TextStyle(
																color: Colors.white,
																fontWeight: FontWeight.w500
															),
														),
														Text(
															"Camera",
															style: TextStyle(
																color: Colors.white,
																fontWeight: FontWeight.bold,
																fontSize: 30
															),
														)
													],
												),
											),
										),
									],
								)
							)
						],
					),
				),
			),
		);
  }
}