import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemBranchJob extends StatelessWidget {
  final JobItem item;

  ItemBranchJob({this.item});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(254, 254, 254, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle
                  ),
                  child: Image.asset(item.access)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      item.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(22, 43, 77, 1),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      item.companyName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(79, 95, 119, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(left: 16),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on, size: 18,color: Color.fromRGBO(99, 115, 131, 1),),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    item.address,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(99, 115, 131, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(left: 16),
            child: Row(
              children: <Widget>[
                Icon(Icons.access_time, size: 18,color: Color.fromRGBO(99, 115, 131, 1),),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    'Thời gian: ' + item.time,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(99, 115, 131, 1),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.attach_money, size: 18,color: Color.fromRGBO(99, 115, 131, 1),),
                        Container(
                          //margin: EdgeInsets.only(left: 8),
                          child: Text(
                            item.money,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(99, 115, 131, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}

class JobItem {
  String title;
  String access;
  String companyName;
  String address;
  String time;
  String money;

  JobItem({this.title, this.access, this.companyName, this.address, this.time, this.money});

}
