import 'package:expanse_tracker/component/bottom-bar.dart';
import 'package:expanse_tracker/model/finance.dart';
import 'package:expanse_tracker/services/finance-service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetail extends StatelessWidget {
  final int categoryId;
  const HistoryDetail({Key? key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FinanceService.getFinance(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('History Detail'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('History Detail'),
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          if (snapshot.data!.isNotEmpty) {
            var financeData = snapshot.data as List<FinanceData>;

            return Scaffold(
              appBar: AppBar(
                title: Text('History Detail'),
              ),
              body: CustomListView(financeData: financeData),
              bottomNavigationBar: BottomBar(),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('History Detail'),
              ),
              body: Center(
                child: Text('No Data'),
              ),
              bottomNavigationBar: BottomBar(),
            );
          }
        }
      },
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<FinanceData> financeData;

  CustomListView({required this.financeData});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 20.0),
          itemCount: financeData.length,
          itemBuilder: (context, index) {
            return _buildListItem(
              financeData[index].needed,
              DateFormat('dd MMMM y')
                  .format(DateTime.parse(financeData[index].createdAt)),
              financeData[index].amount,
            );
          },
        ));
  }

  Widget _buildListItem(String needed, String createdAt, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 8.0), // Ubah padding vertikal
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              needed,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              createdAt,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              amount,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
