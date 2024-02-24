class CommonResp {
  int? status;
  String? message;
  String? error;
  dynamic data;

  CommonResp({this.status, this.message, this.error, this.data});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['status'] = status;
    data['msg'] = message;
    data['error'] = error;
    data['data'] = this.data;
    return data;
  }

  CommonResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['msg'];
    error = json['error'];
    data = json['data'];
  }

  @override
  String toString() {
    return 'CommonResp(status: $status, message: $message, error: $error, data: $data)';
  }
}
