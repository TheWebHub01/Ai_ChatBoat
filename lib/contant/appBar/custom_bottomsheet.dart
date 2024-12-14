import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  List<String> type = ["Email", "Messages"];
  List<String> length = ["Short", "Medium", "Long"];
  List<bool> isTypeSelected = [false, false];
  List<bool> isLengthSelected = [false, false, true];
  late String isTypeSelectedList;
  late String isLengthSelectedList;

  int _selectedIndex = -1;

  final List<GridItem> items = [
    GridItem(Icons.emoji_emotions, "Friendly"),
    GridItem(Icons.business_center, "Business"),
    GridItem(Icons.favorite, "Romantic"),
    GridItem(Icons.mood_bad, "Angry"),
    GridItem(Icons.psychology, "Witty"),
    GridItem(Icons.work, "Professional"),
    GridItem(Icons.school, "Academic"),
    GridItem(Icons.thumb_up, "Confident"),
    GridItem(Icons.emoji_people, "Happy"),
    GridItem(Icons.sentiment_dissatisfied, "Sad"),
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xff909090)),
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60),
        ),
      ),
      height: screenHeight * 0.8, // 80% of the screen height
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01), // 1% of screen height
              Center(
                child: Text(
                  "Write Style",
                  style: TextStyle(
                      fontSize: screenWidth * 0.06), // Dynamic font size
                ),
              ),

              const Text("Text Type"),
              SizedBox(height: screenHeight * 0.01), // 1% of screen height
              SizedBox(
                height: screenHeight * 0.08, // 8% of screen height for ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: type.length,
                  itemBuilder: (context, s) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTypeSelectedList = type[s];
                            isTypeSelected[s] = !isTypeSelected[s];
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.3, // 25% of screen width
                          height: screenHeight * 0.06,
                          decoration: BoxDecoration(
                            gradient: isTypeSelected[s]
                                ? const LinearGradient(colors: [
                                    Color(0xff9247E7),
                                    Color(0xff4D35E5),
                                  ])
                                : const LinearGradient(colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                  ]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01,
                                horizontal: screenWidth * 0.04,
                              ),
                              child: Text(
                                type[s],
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              const Text("Text Length"),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.08, // 8% of screen height for ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: length.length,
                  itemBuilder: (context, s) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLengthSelectedList = length[s];
                            isLengthSelected[s] = !isLengthSelected[s];
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.25, // 25% of screen width
                          height: screenHeight * 0.06, // 6% of screen height
                          decoration: BoxDecoration(
                            gradient: isLengthSelected[s]
                                ? const LinearGradient(colors: [
                                    Color(0xff9247E7),
                                    Color(0xff4D35E5),
                                  ])
                                : const LinearGradient(colors: [
                                    Color(0xff321840),
                                    Color(0xff1b133f),
                                  ]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              length[s],
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: isLengthSelected[s]
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              const Text("Writing Tone"),
              SizedBox(height: screenHeight * 0.02),
              // Expanded(
              //     child: Container(
              //         color: Colors.grey)),
              //
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // Number of columns
                    childAspectRatio: 2.5,
                    // Width to height ratio
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 50),
                itemCount: items.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildGridItem(items[index], index);
                },
              ),

              //
              //// Replace with GridViewScreen
              GestureDetector(
                onTap: () {
                  // grammerController.spellCheckValidate();
                },
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.07, // 7% of screen height
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF9247E7),
                      Color(0xFF4D35E5),
                    ]),
                  ),
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(GridItem item, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Update the selected index
        });
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(colors: [
                  Color(0xff9247E7),
                  Color(0xff4D35E5),
                ])
              : const LinearGradient(colors: [
                  Color(0xff232323),
                  Color(0xff232323),
                ]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            decoration: BoxDecoration(
              gradient: isSelected
                  ? const LinearGradient(colors: [
                      Color(0xff9247E7),
                      Color(0xff4D35E5),
                    ])
                  : const LinearGradient(colors: [
                      Color(0xff321840),
                      Color(0xff1b133f),
                    ]),
              borderRadius: BorderRadius.circular(12),
              // color: isSelected ? Colors.purpleAccent : Colors.purple, // Change color if selected
              // borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(item.label, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
// }
}

class GridItem {
  final IconData icon;
  final String label;

  GridItem(this.icon, this.label);
}
