import 'package:ai_chatboat/contant/appBar/custom_appbar.dart';
import 'package:ai_chatboat/contant/appBar/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AcademicWritingScreen extends StatefulWidget {
  const AcademicWritingScreen({super.key});

  @override
  State<AcademicWritingScreen> createState() => _AcademicWritingScreenState();
}

class _AcademicWritingScreenState extends State<AcademicWritingScreen> {
  TextEditingController academicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Academic Writing"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              "What topic or subject would you like to write about?",
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16),
            ),
            const Text(
              "Example: Analyzing the impact of climate change on fauna and biodiversity in tropical regions.",
              style: TextStyle(color: Color(0xff848484), fontSize: 14),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: academicController,
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlignVertical: TextAlignVertical.center,
                maxLines: 99999,
                decoration: InputDecoration(
                    filled: true,
                    // fillColor: const Color(0xFF131313),
                    isDense: true,
                    hintText: "Enter Your Text...",
                    hintStyle: TextStyle(
                      color: Color(0xFF909090),
                      fontWeight: FontWeight.w300,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xff181818)
                              : Color(0xffECEBEB),
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xff181818)
                              : Color(0xffECEBEB),
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFECEBEB),
                        ),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(60.0)),
                  ),
                  // backgroundColor: Colors.black,
                  context: context,
                  builder: (context) => const CustomBottomSheet(),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    // color: const Color(0xFF131313),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xff181818)
                          : Color(0xffECEBEB),

                      // / const Color(0xff181818),
                    )),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Write Style",
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xffFFFFFF)
                              : Color(0xff909090),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/svg/down arrow.svg"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                // width: double.infinity,
                // height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF9247E7), Color(0xFF4D35E5)])),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
