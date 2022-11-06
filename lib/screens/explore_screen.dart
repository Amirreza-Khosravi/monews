import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 232, 232),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _getAppBar(),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 30),
              ),
              SliverToBoxAdapter(
                child: _getBanner(),
              ),
              SliverToBoxAdapter(
                child: _getHeadLine(),
              ),
              SliverToBoxAdapter(
                child: _getHeaderChannels(),
              ),
              SliverToBoxAdapter(
                child: _getChannels(),
              ),
              SliverToBoxAdapter(
                child: _getHeaderposts(),
              ),
              SliverToBoxAdapter(
                child: _getPostsuggestion(),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Image.asset("images/search_normal.png"),
            SizedBox(width: 27),
            Image.asset("images/filter_edit.png"),
            Spacer(
              flex: 3,
            ),
            Image.asset("images/monews.png"),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBanner() {
    return Container(
      height: 200,
      child: PageView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              width: 370,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('images/Banner_1.png'),
              ),
            ),
          ),
          Container(
            width: 400,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/Banner_2.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeaderChannels() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        children: [
          Text(
            'خبرگزاری ها',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xff1C1F2E),
            ),
          ),
          Spacer(),
          Text(
            'مشاهده بیشتر',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xffFF033E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeaderposts() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        children: [
          Text(
            'پیشنهاد سردبیر',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xff1C1F2E),
            ),
          ),
          Spacer(),
          Text(
            'مشاهده بیشتر',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'SB',
              fontWeight: FontWeight.bold,
              color: Color(0xffFF033E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostsuggestion() {
    return Container(
      width: 271,
      height: 159,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 24),
            child: Stack(
              children: [
                Container(
                  width: 271,
                  height: 159,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(_getImagePostsuggestion()[
                          index < 3 ? index : index ~/ 2]),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffFF033E),
                    ),
                    child: Text(
                      _getNamePostsuggestion()[index < 3 ? index : index ~/ 2],
                      style: TextStyle(
                          fontSize: 10, fontFamily: 'SB', color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _getHeadLine() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 40,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: Container(
              width: 76,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color:
                    selectedIndex == index ? Color(0xffFFCDD8) : Colors.white,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: (() {
                    setState(() {
                      selectedIndex = index;
                    });
                  }),
                  child: Text(
                    _headLineName()[index],
                    style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 13,
                        color: selectedIndex == index
                            ? Color(0xffFF033E)
                            : Color(0xffBFC3C8)),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getChannels() {
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              width: 133,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Container(
                    width: 56,
                    height: 56,
                    child: Image.asset(
                        _getProfileChnnel()[index < 5 ? index : index ~/ 4]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _getNameChnnel()[index < 5 ? index : index ~/ 4],
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'SB',
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C1F2E),
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffFFCDD8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: () {},
                    child: Text(
                      'دنبال کردن',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SB',
                        color: Color(0xffFF033E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _getImagePostsuggestion() {
    return <String>[
      'images/post1.png',
      'images/post2.jpg',
      'images/post3.jpg',
    ];
  }

  List<String> _getNamePostsuggestion() {
    return <String>[
      'علمی پزشکی',
      'ورزشی',
      'تکنولوژی',
    ];
  }

  List<String> _getProfileChnnel() {
    return <String>[
      'images/channel4.png',
      'images/channel2.png',
      'images/channel3.png',
      'images/channel1.png',
      'images/channel5.png',
    ];
  }

  List<String> _getNameChnnel() {
    return <String>[
      'دیجیاتو',
      'زومیت',
      'ورزش سه',
      'آخرین خبر',
      'فوتبال 360',
    ];
  }

  List<String> _headLineName() {
    return <String>[
      'همه',
      'جهان',
      'ورزش',
      'تکنولوژی',
      'علم و دانش',
    ];
  }
}
