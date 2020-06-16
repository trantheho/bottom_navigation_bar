import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCompanyJob extends StatefulWidget {
  final CompanyJobItem companyJobItem;

  ItemCompanyJob({this.companyJobItem});

  @override
  _ItemCompanyJobState createState() => _ItemCompanyJobState();
}

class _ItemCompanyJobState extends State<ItemCompanyJob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 120,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 14, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(254, 254, 254, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.5),
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 42,
              height: 42,
              child: Center(child: Image.asset(widget.companyJobItem.asset)),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                child: Text(
                  widget.companyJobItem.companyName,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(22, 43, 77, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Color.fromRGBO(99, 115, 131, 1),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      widget.companyJobItem.address,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(99, 115, 131, 1),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                child: Text(
                  '+${widget.companyJobItem.counterJob} Việc làm đăng tải',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(0, 153, 153, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyJobItem {
  String asset;
  String companyName;
  String address;
  int counterJob;

  CompanyJobItem({this.asset, this.companyName, this.address, this.counterJob});
}
