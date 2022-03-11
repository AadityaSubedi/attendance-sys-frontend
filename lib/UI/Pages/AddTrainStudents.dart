

import 'package:attendance_sys/constants.dart';
import 'package:attendance_sys/function.dart';
import 'package:attendance_sys/main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CustomIconButton extends StatelessWidget {
  CustomIconButton({@required this.onPress});
  final onPress;

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: Color(0xFF265784),
        child: IconButton(
          hoverColor: Colors.transparent,
          // borderWidth: 1,
          // buttonSize: 60,
          icon: const Icon(
            Icons.add_circle,
            color: Color(0xFFEA734D),
            size: 60,
          ),
          onPressed: onPress,
        ));
  }
}

class AddTrainStudentScreen extends StatefulWidget {
  const AddTrainStudentScreen({Key? key}) : super(key: key);
  static const routeName = "/addtrainstudent";

  @override
  _AddTrainStudentScreenState createState() => _AddTrainStudentScreenState();
}

class _AddTrainStudentScreenState extends State<AddTrainStudentScreen> {
  String uploadedFileUrl = '';
  late TextEditingController textController1;
  late TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final ImagePicker _picker = ImagePicker();

  //List allImages = [];
  Map<String, dynamic> faceImages = {};
  List detectedImages = [];

  void pickImages() async {
    List imagePaths = [];
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != []) {
      //allImages.removeLast();
      // images!.forEach((image) {
      //   faceImages[image.path] = null;
      // });
      images!.forEach((image) => {imagePaths.add(image.path)});
      //allImages.addAll(images);
      const url = '$BACKEND_URL/train/check';
      try {
        //faceImages.forEach((key, _) => imagePaths.add(key));
        Map<String, dynamic> detected = await uploadImage(imagePaths, url);
        faceImages = {...faceImages, ...detected};
        detectedImages = faceImages.keys.toList();
        //detectedImages.addAll(detected.values.toList());
      } catch (err) {
        print(err);
      }
    }
    setState(() {});
  }

  void onUpload(label) async {
    try {
      const url = '$BACKEND_URL/train/upload';
      await uploadImage(detectedImages, url, label: label);
    } catch (err) {
      print(err);
    }
  }

  void onTrain() async {
    try {
      const url = '$BACKEND_URL/train/start';
      Uri uri = Uri.parse(url);
      await http.post(uri);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //allImages.add(CustomIconButton(onPress: pickImages));
    // });
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.14),
        child: AppBar(
          backgroundColor: Color(0xFF265784),
          automaticallyImplyLeading: true,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.5, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                  child: Text(
                    'Smart \nAttendance',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.95, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.015,
                  decoration: BoxDecoration(
                    color: Color(0xFF265784),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.85, 0),
                child: InkWell(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Are you sure to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () async {
                                // logout
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0, 0.15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/2123.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Color(0xFF265784),
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.white,
                      width: 0,
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(0),
                      ),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController1',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Class',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF265784),
                        ),
                        suffixIcon: textController1.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textController1.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF265784),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Color(0x7F265784),
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(35, 10, 35, 20),
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController2',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Roll  No',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF265784),
                        ),
                        suffixIcon: textController2.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textController2.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF265784),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Color(0x7F265784),
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        // itemCount: allImages.length + 1,
                        itemCount: detectedImages.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: index == detectedImages.length
                                  ? CustomIconButton(onPress: pickImages)
                                  : Stack(
                                      fit: StackFit.expand,
                                      children: [
                              
                                        Image.network(
                                          "$BACKEND_URL/face/${faceImages[detectedImages[index]]}",
                                          fit: BoxFit.cover,
                                        ),

                                        // (kIsWeb
                                        //     ? Image.network(
                                        //         allImages[index].path,
                                        //         fit: BoxFit.cover,
                                        //       )
                                        //     : Image.file(
                                        //         File(allImages[index].path),
                                        //         fit: BoxFit.cover,
                                        //       )),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: Container(
                                              color: Color.fromRGBO(
                                                  255, 255, 244, 0.7),
                                              height: 25,
                                              width: 25,
                                              child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () {
                                                    print(faceImages);
                                                    detectedImages.removeWhere(
                                                        (value) =>
                                                            value == detectedImages[
                                                                index]);
                                                    faceImages.removeWhere((key,
                                                            value) =>
                                                        key ==
                                                        detectedImages[index]);


                                                    // detectedImages
                                                    //     .removeAt(index);
                                                    setState(() {});
                                                  },
                                                  iconSize: 18.0,
                                                  icon: Icon(Icons.delete),
                                                  color: Colors.red)),
                                        ),
                                      ],
                                    ));
                        }),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          primary: colorSecondary,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () => onUpload(textController2.text),
                        child: const Text(
                          'Upload',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          primary: colorSecondary,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () => {},
                        child: const Text(
                          'Train',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
