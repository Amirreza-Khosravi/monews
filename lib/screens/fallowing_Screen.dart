import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class fallowingScreen extends StatelessWidget {
  const fallowingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _getMainContent(),
        ],
      )),
    );
  }

  Widget _getMainContent() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                width: 133,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0Xff1C1F2E),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: 80,
                      height: 60,
                      child: Image.asset(
                          _getProfileChnnel()[index < 8 ? index : index ~/ 7]),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '',
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
                        'دنبال میکنید',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SB',
                          color: Color(0xffFF033E),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: 10),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 110))
      ],
    );
  }

  List<String> _getProfileChnnel() {
    return <String>[
      'images/channel4.png',
      'images/channel2.png',
      'images/channel3.png',
      'images/channel1.png',
      'images/channel5.png',
      'images/channel6.jpg',
      'images/channel4.png',
      'images/channel3.png',
    ];
  }
}
