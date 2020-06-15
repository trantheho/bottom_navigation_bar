import 'package:bottomnavigationbar/item_branch_job.dart';
import 'package:bottomnavigationbar/item_company_job.dart';
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
  List<JobItem> jobs = [
    JobItem(
        title: 'Mua phế liệu',
        companyName: 'CTY TNHH Hòa Phát',
        access: 'assets/icons/logo1.png',
        address: '138 Lê lợi, Q.Hoàn Kiếm, Đông Anh, Hà Nội',
        time: '9H-10H',
        money: '100.000 VND'),
    JobItem(
        title: 'Mua phế liệu',
        companyName: 'CTY TNHH Hòa Phát',
        access: 'assets/icons/logo1.png',
        address: '138 Lê lợi, Q.Hoàn Kiếm, Đông Anh, Hà Nội',
        time: '9H-10H',
        money: '100.000 VND'),
    JobItem(
        title: 'Mua phế liệu',
        companyName: 'CTY TNHH Hòa Phát',
        access: 'assets/icons/logo1.png',
        address: '138 Lê lợi, Q.Hoàn Kiếm, Đông Anh, Hà Nội',
        time: '9H-10H',
        money: '100.000 VND'),
    JobItem(
        title: 'Mua phế liệu',
        companyName: 'CTY TNHH Hòa Phát',
        access: 'assets/icons/logo1.png',
        address: '138 Lê lợi, Q.Hoàn Kiếm, Đông Anh, Hà Nội',
        time: '9H-10H',
        money: '100.000 VND'),

  ];


  List<CompanyJobItem> company = [
    CompanyJobItem(
      asset: 'assets/icons/logo1.png',
      companyName: 'RoyalTea Coffee',
      address: '123 Tân Bình, Tp.HCM',
      counterJob: 20,
    ),
    CompanyJobItem(
      asset: 'assets/icons/logo4.jpg',
      companyName: 'RoyalTea Coffee',
      address: '123 Tân Bình, Tp.HCM',
      counterJob: 20,
    ),
    CompanyJobItem(
      asset: 'assets/icons/logo3.png',
      companyName: 'RoyalTea Coffee',
      address: '123 Tân Bình, Tp.HCM',
      counterJob: 20,
    ),
    CompanyJobItem(
      asset: 'assets/icons/logo2.jpg',
      companyName: 'RoyalTea Coffee',
      address: '123 Tân Bình, Tp.HCM',
      counterJob: 20,
    ),
    CompanyJobItem(
      asset: 'assets/icons/logo3.png',
      companyName: 'RoyalTea Coffee',
      address: '123 Tân Bình, Tp.HCM',
      counterJob: 20,
    ),
    CompanyJobItem(
      asset: 'assets/icons/logo4.jpg',
      companyName: 'RoyalTea Coffee',
      address: '123 Tân Bình, Tp.HCM',
      counterJob: 20,
    ),
  ];


  @override
  void initState() {
    super.initState();
    iconAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 80),
            Container(
              margin: EdgeInsets.only(left: 14),
              alignment: Alignment.centerLeft,
              child: Text(
                'Home',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 14, top: 8),
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
                          color: Color.fromRGBO(0, 153, 153, 1),
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
                  Container(
                    child: IconButton(
                      icon:AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: iconAnimationController,),
                      splashColor: Colors.transparent,
                      color: Color.fromRGBO(0, 153, 153, 1),
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
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 32, left: 14),
              child: Text(
                'Header 01',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 16),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: company.length,
                  itemBuilder: (context, index){
                    return ItemCompanyJob(companyJobItem: company[index],);
                  }),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 14),
              child: Text(
                'Header 02',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              height: 300.0,
              margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 16),
              child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: jobs.length,
                  itemBuilder: (context, index){
                    return ItemBranchJob(item: jobs[index],);
                  }),
            )
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
                color: Colors.white
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
