import 'package:bottomnavigationbar/item_branch_job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeScreen(),
    );
  }
}



class _HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> with SingleTickerProviderStateMixin{
  FocusNode focusNode;
  AnimationController iconAnimationController;
  bool start = false;
  List<String> jobName = ['Du lịch', 'Nhà hàng', 'Vận tải', 'Khách sạn'];


  @override
  void initState() {
    super.initState();
    iconAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  color: Color.fromRGBO(0, 153, 153, 1),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 80),
                Container(
                  margin: EdgeInsets.only(left: 14, right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildSearch(),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                              size: 26,
                            ),
                            Positioned(
                              top: 2,
                              right: 3,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                     /* Container(
                        child: IconButton(
                          icon:AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: iconAnimationController,),
                          splashColor: Colors.transparent,
                          color: Colors.white,
                          iconSize: 26,
                          onPressed: (){
                            if(!start){
                              iconAnimationController.forward();
                              start = true;
                            }else{
                              iconAnimationController.reverse();
                              start = false;
                            }
                          },
                        ),
                      ),*/
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 26),
                  child: ListView.builder(
                    itemCount: jobName.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return ItemBranchJob(
                        title: jobName[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildSearch(){
    return new Flexible(
      child: Container(
        height: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width * 320 / 375 ,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                border: Border.all(width: 1, color: Colors.grey),
                color: Colors.grey[50]
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),

                  Expanded(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: 30,
                        padding: EdgeInsets.only(left: 8),
                        margin: EdgeInsets.only(top: 12),
                        child: TextField(
                          focusNode: focusNode,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /*Icon(
                    Icons.close,
                    color: Colors.black45,
                    size: 18,
                  ),*/
                ],
              ),
            )
        ),
      ),
    );

  }

}
