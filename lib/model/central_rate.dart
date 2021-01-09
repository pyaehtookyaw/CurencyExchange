// class CentralRateModel {
//   String info;
//   String description;
//   String timestamp;
//   List rates;

//   CentralRateModel({this.info, this.description, this.timestamp, this.rates});

//   CentralRateModel.fromJson(Map<String, dynamic> json) {
//     info = json['info'];
//     description = json['description'];
//     timestamp = json['timestamp'];
//     if (json['rate'] != null) {
//       rates = new List();
//       json['rate'].forEach((v) {
//         rates.add(v);
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['info'] = this.info;
//     data['description'] = this.description;
//     data['timestamp'] = this.timestamp;
//     if (this.rates != null) {
//       data['rates'] = this.rates.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
