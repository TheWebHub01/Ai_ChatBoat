import 'dart:convert';

import 'package:ai_chatboat/screens/explore/writing/academic_writing_screen.dart';
import 'package:ai_chatboat/screens/tools/tools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const ExploreScreen({super.key, required this.onThemeChanged});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<StaggeredGridTile> recentCardTile = [];
  Future<void> _loadRecentItems() async {
    List<Map<String, String>> recentItems = await RecentItems.getRecentItems();

    for (var item in recentItems) {
      recentCardTile.add(
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.1,
          child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: int.tryParse(item['itemId'] ?? '') ??
                0, // Convert itemId to int, default to 0 if invalid
            text: item['itemname'] ??
                'Unknown Item', // Access itemname from the map
            icondata: item['imageurl'] ??
                'assets/svg/default_icon.svg', // Access imageurl from the map
          ),
        ),
      );
    }
  }

  List assistantNames = [
    'Recent',
    'All',
    'Writing',
    'Business',
    'Popular',
    'Language Tool',
    'Others'
  ];
  late List<StaggeredGridTile> writingCardTile = [];
  late List<StaggeredGridTile> businessCardTile = [];
  late List<StaggeredGridTile> languageToolCardTile = [];
  late List<StaggeredGridTile> othersCardTile = [];
  late List<StaggeredGridTile> popularCardTile = [];

  int selectedIndex = 1;
  String selectedName = "All";
  @override
  void initState() {
    writingCardTile = [
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.5,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 1,
            text: "Academic\nWriting",
            icondata: "assets/svg/academic_writing.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.68,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 2,
            text: 'Social Contact',
            icondata: "assets/svg/social_contact.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 3,
            text: 'Lyrics',
            icondata: "assets/svg/lyrics.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.68,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 4,
            text: 'Poem',
            icondata: "assets/svg/poem.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 0.85,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 5,
            text: 'Storytelling',
            icondata: "assets/svg/story_telling.svg"),
      ),
    ];
    businessCardTile = [
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.4,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 6,
            text: "Business\nPlan",
            icondata: "assets/svg/business_plan.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 7,
            text: 'Competitor\nAnalysis',
            icondata: "assets/svg/competitor_analys.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 8,
            text: 'Proposal for\nClient',
            icondata: "assets/svg/proposal_client.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.4,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 9,
            text: 'Speech',
            icondata: "assets/svg/speech.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.4,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 10,
            text: 'Cover\nLetter',
            icondata: "assets/svg/cover_latter.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.4,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 11,
            text: 'Interviewing',
            icondata: "assets/svg/interviewing.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 12,
            text: 'Meeting',
            icondata: "assets/svg/meeting.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.4,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 13,
            text: 'Weekly\nReport',
            icondata: "assets/svg/weekly_report.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 14,
            text: 'Summary',
            icondata: "assets/svg/summary.svg"),
      ),
    ];
    languageToolCardTile = [
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.5,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 15,
            text: "Grammar",
            icondata: "assets/svg/grammer.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.75,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 16,
            text: 'Paraphrasing',
            icondata: "assets/svg/paraphrasing.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 17,
            text: 'Synonym',
            icondata: "assets/svg/synonym.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.75,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 18,
            text: 'Translation',
            icondata: "assets/svg/translation.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 19,
            text: 'Summary',
            icondata: "assets/svg/summary_laun.svg"),
      ),
    ];
    othersCardTile = [
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 20,
            text: "Dream\nInterpreter",
            icondata: "assets/svg/dream_interpreter.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 21,
            text: 'Book\nSummary',
            icondata: "assets/svg/book_summary.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 22,
            text: 'Holiday\nWish',
            icondata: "assets/svg/holiday_wish.svg"),
      ),
    ];

    popularCardTile = [
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 23,
            text: "Replay",
            icondata: "assets/svg/replay.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 24,
            text: 'Continue\nWriting',
            icondata: "assets/svg/countinue_writing.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 25,
            text: 'Instagram\nCaption',
            icondata: "assets/svg/instagram_post.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 26,
            text: 'Facebook\nPost',
            icondata: "assets/svg/facebook_post.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.4,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 27,
            text: 'Explain',
            icondata: "assets/svg/explain.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.5,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 28,
            text: 'Phrase to\nEmoji',
            icondata: "assets/svg/pharse_emoji.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 29,
            text: 'Replies',
            icondata: "assets/svg/replies.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.5,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 30,
            text: 'Summary',
            icondata: "assets/svg/summry_popular.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 31,
            text: 'Emojify',
            icondata: "assets/svg/emojify.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 32,
            text: 'Text to\nTweet',
            icondata: "assets/svg/text_tweet.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 0.9,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 33,
            text: 'Essay',
            icondata: "assets/svg/essay.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1.2,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 34,
            text: 'Opening\nLine',
            icondata: "assets/svg/opening_line.svg"),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: BackGroundTile(
            recentCardTile: recentCardTile,
            id: 35,
            text: 'Study\nNotes',
            icondata: "assets/svg/study_nodets.svg"),
      ),
    ];

    _loadRecentItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < assistantNames.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                        selectedName = assistantNames[i];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          selectedIndex == i
                              ? const Color(0xFF9247E7)
                              : const Color(0xFF9247E7).withOpacity(0.2),
                          selectedIndex == i
                              ? const Color(0xFF4D35E5)
                              : const Color(0xFF4D35E5).withOpacity(0.2)
                        ]),
                        borderRadius: BorderRadius.circular(40),
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [Color(0xFF9247E7), Color(0xFF4D35E5)]),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        assistantNames[i],
                        style: TextStyle(
                            color: selectedIndex == i
                                ? Colors.white
                                : Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedIndex == 0
                            ? 'Recent'
                            : selectedIndex == 1
                                ? 'All'
                                : selectedIndex == 2
                                    ? 'Writing'
                                    : selectedIndex == 3
                                        ? 'Business'
                                        : selectedIndex == 4
                                            ? 'Popular'
                                            : selectedIndex == 5
                                                ? 'Language Tool'
                                                : selectedIndex == 6
                                                    ? 'Others'
                                                    : "All",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 15),
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        children: selectedIndex == 0
                            ? recentCardTile
                            : selectedIndex == 1
                                ? [
                                    //text
                                    ...writingCardTile,
                                    //text
                                    ...businessCardTile,
                                    //text
                                    ...languageToolCardTile,
                                    //text
                                    ...othersCardTile,
                                    //text
                                    ...popularCardTile,
                                  ]
                                : selectedIndex == 2
                                    ? writingCardTile
                                    : selectedIndex == 3
                                        ? businessCardTile
                                        : selectedIndex == 4
                                            ? popularCardTile
                                            : selectedIndex == 5
                                                ? languageToolCardTile
                                                : selectedIndex == 6
                                                    ? othersCardTile
                                                    : [],
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ])),
          )),
        ],
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final String icondata;
  final String text;
  final int id;
  List<StaggeredGridTile> recentCardTile;
  BackGroundTile(
      {super.key,
      required this.icondata,
      required this.text,
      required this.id,
      required this.recentCardTile});
  Future<void> _loadRecentItems() async {
    List<Map<String, String>> recentItems = await RecentItems.getRecentItems();

    // Clear the previous list if you need to reload
    recentCardTile.clear();

    for (var item in recentItems) {
      // Add item to the list if not already present
      bool isItemAlreadyInList = recentCardTile.any((tile) {
        final backgroundTile = tile.child as BackGroundTile;
        return backgroundTile.id == int.tryParse(item['itemId'] ?? '');
      });

      // Only add if it's not already in the list
      if (!isItemAlreadyInList) {
        recentCardTile.add(
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.1,
            child: BackGroundTile(
              recentCardTile: recentCardTile,
              id: int.tryParse(item['itemId'] ?? '') ??
                  0, // Convert itemId to int
              text: item['itemname'] ??
                  'Unknown Item', // Access itemname from the map
              icondata: item['imageurl'] ??
                  'assets/svg/default_icon.svg', // Access imageurl from the map
            ),
          ),
        );
      }
    }

    // Call setState to update the UI
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, // First argument: BuildContext
          MaterialPageRoute(
              // Second argument: Route to navigate to
              builder: (context) => AcademicWritingScreen()),
        );

        RecentItems.addToRecent(id, text, icondata);
        _loadRecentItems();
        print("==_loadRecentItems");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage(
              "assets/png/Mask group (2).png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SvgPicture.asset(icondata)),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 17),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? "assets/svg/arrow.svg"
                        : "assets/svg/arrow_light.svg")),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class RecentItems {
  static const String recentKey = 'recentItems';

  // Add itemId, itemname, and imageurl to recent items
  static Future<void> addToRecent(
      int itemId, String itemname, String imageurl) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recentItems = prefs.getStringList(recentKey) ?? [];

    // Check if the itemId is already in the list
    int existingIndex = recentItems.indexWhere((item) {
      return jsonDecode(item)['itemId'] == itemId.toString();
    });

    // If the item exists, remove it from its current position
    if (existingIndex != -1) {
      recentItems.removeAt(existingIndex);
    }

    // Create a map to store item details and convert it to JSON
    Map<String, String> item = {
      'itemId': itemId.toString(),
      'itemname': itemname,
      'imageurl': imageurl,
    };

    // Add the new item to the beginning
    recentItems.insert(0, jsonEncode(item));

    // Limit the list to a maximum of 5 items
    if (recentItems.length > 5) {
      recentItems.removeLast();
    }

    // Save the list back to SharedPreferences
    await prefs.setStringList(recentKey, recentItems);
  }

  // Get the list of recent items with itemId, itemname, and imageurl
  static Future<List<Map<String, String>>> getRecentItems() async {
    final prefs = await SharedPreferences.getInstance();
// prefs.clear();
    List<String> recentItems = prefs.getStringList(recentKey) ?? [];

    // Convert each JSON string back to a Map
    return recentItems
        .map((item) => Map<String, String>.from(jsonDecode(item)))
        .toList();
  }
}
