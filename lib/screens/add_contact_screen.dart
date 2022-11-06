import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AddContent extends StatelessWidget {
  const AddContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff1C1F2E),
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _getMainContent(),
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Draft',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'GB',
                        color: Color(0xffF35383)),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                        fontSize: 16, fontFamily: 'GB', color: Colors.white),
                  ),
                  Text(
                    'Take',
                    style: TextStyle(
                        fontSize: 16, fontFamily: 'GB', color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _getMainContent() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeader(),
        ),
        SliverToBoxAdapter(
          child: _getImageContent(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('images/post$index.png'),
                  ),
                ),
              );
            }, childCount: 3),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              repeatPattern: QuiltedGridRepeatPattern.same,
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

  Widget _getImageContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      height: 375,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('images/post3.jpg'),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 27),
      child: Row(
        children: [
          Text(
            'Post',
            style:
                TextStyle(fontFamily: 'GB', color: Colors.white, fontSize: 16),
          ),
          SizedBox(width: 15),
          Image.asset('images/icon_down.png'),
          Spacer(),
          Text(
            'Next',
            style:
                TextStyle(fontFamily: 'GB', color: Colors.white, fontSize: 16),
          ),
          SizedBox(width: 15),
          Image.asset('images/icon_right_box.png'),
        ],
      ),
    );
  }
}
