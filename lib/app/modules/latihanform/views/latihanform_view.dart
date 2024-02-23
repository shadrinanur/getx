import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihanform_controller.dart';
import 'package:intl/intl.dart';

class LatihanformView extends GetView<LatihanformController> {
  LatihanformView({Key? key}) : super(key: key);

  final LatihanformController latihanformController = LatihanformController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LatihanformView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'A. Personal Informaton',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Fullname'),
                      onChanged: (value) =>
                      latihanformController.fullname.value = value,
                    ),
                    SizedBox(height : 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Place Of Birth'),
                      onChanged: (value)  => 
                      latihanformController.placeoffbirth.value = value,
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => latihanformController.selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          hintText: 'Pick date',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Date of Birth:'),
                            Obx(() => Text(
                              DateFormat('yyyy-MM-dd')
                              .format(latihanformController.selectedDate.value),
                              )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Man',
                              groupValue: latihanformController.gender.value,
                              onChanged: (value) =>
                                  latihanformController.gender.value = value!,
                            )),
                        Text('Man'),
                        Obx(() => Radio(
                              value: 'Women',
                              groupValue: latihanformController.gender.value,
                              onChanged: (value) =>
                                  latihanformController.gender.value = value!,
                            )),
                        Text('Women'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) =>
                      latihanformController.email.value = value,
                    ),
                    SizedBox(height : 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nationality'),
                      onChanged: (value) =>
                      latihanformController.nationality.value = value,
                    ),
                    SizedBox(height : 16.0),
                     Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'B. Type of Membership',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                      children: [
                        Obx(() => Checkbox(
                          value: latihanformController.isRegulerMember.value,
                          onChanged: (value) => latihanformController.isRegulerMember.value = value!,
                        )),
                        
                        Text('Reguler'),
                        Obx(() => Checkbox(
                          value: latihanformController.isGoldMember.value,
                          onChanged: (value) => latihanformController.isGoldMember.value = value!,
                        )),
                        
                        Text('Gold'),
                        Obx(() => Checkbox(
                          value: latihanformController.isPlatinumMember.value,
                          onChanged: (value) => latihanformController.isPlatinumMember.value = value!,
                        )),
                        
                        Text('Platinum'),
                        Obx(() => Checkbox(
                          value: latihanformController.isVipMember.value,
                          onChanged: (value) => latihanformController.isVipMember.value = value!,
                        )),
                        Text('VIP'),
                      ],
                    ),
                    SizedBox(height: 10),
                     Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'C. Payment Detail',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                     Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Card Number'),
            onChanged: (value) =>
                latihanformController.cardNumber.value = value,
          ),
          SizedBox(height: 16.0),
          Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Expired Date (YYYY/MM/DD)'),
                            onChanged: (value) => latihanformController.expiredDate.value = value,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Payment'),
                            onChanged: (value) => latihanformController.payment.value = value,
                          ),
                        ),
                      ],
                    ),
        ],
      ),
    ),
    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => latihanformController.submitForm(),
                      child: Text('Submit'),
                    ),
                  ],
                ),
                ),
                Obx(() {
                if (latihanformController.isFormSubmitted.value) {
                  final age = DateTime.now().year -
                  latihanformController.selectedDate.value.year;

                  String output = 
                  'Fullname: ${latihanformController.fullname.value}, Place of birth: ${latihanformController.placeoffbirth.value}, Date of birth: ${DateFormat('yyyy-MM-dd').format(latihanformController.selectedDate.value)}, Age: $age, Gender: ${latihanformController.gender.value}, Email: ${latihanformController.email.value}, Nationality: ${latihanformController.nationality.value}';

                  List<String> membership = latihanformController.selectedmembership();

                  if (membership.isNotEmpty) {
              output += '\nMembership: ${membership.join(',')}';


         for (String membership in membership) {
          if (membership == 'Reguler') {
          output += '\nAnggota: 1 bulan';
          } else if (membership == 'Gold') {
          output += '\nAnggota: 1 bulan';
          output += '\nBenefits: Cemilan Gratis';
          } else if (membership == 'Platinum') {
          output += '\nAnggota: 2 bulan';
          output += '\nBenefits: Cemilan Gratis, Free Wifi';
          } else if (membership == 'VIP') {
          output += '\nAnggota: 3 bulan';
          output += '\nBenefits: Cemilan Gratis, Free Wifi, Tiket Konser';
    }
  }
}
                
               if (latihanformController.payment.value.isNotEmpty) {
                output += '\nCard Number: ${latihanformController.cardNumber.value}\n';
                output += 'Expired Date: ${latihanformController.expiredDate.value}\n';
                output += 'Payment: ${latihanformController.payment.value}';


               int totalPrice = 0;
               if (latihanformController.isRegulerMember.value) {
                 totalPrice = 50000;
             } else if (latihanformController.isGoldMember.value) {
                 totalPrice = 150000;
             } else if (latihanformController.isPlatinumMember.value) {
                 totalPrice = 250000;
             } else if (latihanformController.isVipMember.value) {
                totalPrice = 500000;
             }

            output += '\nTotal Price: $totalPrice';

             int paymentAmount = int.tryParse(latihanformController.payment.value) ?? 0;
             int change = paymentAmount - totalPrice;

              output += '\nChange: $change';
            }

    return Text(
      output,
      style: TextStyle(fontSize: 16.0),
    );
                } else {
                  return SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}


