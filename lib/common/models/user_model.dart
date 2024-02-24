class RegisterReq {
  String? username;
  String? password;

  RegisterReq({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = username;
    data['password'] = password;
    return data;
  }
}

class LoginReq {
  String? username;
  String? password;

  LoginReq({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = username;
    data['password'] = password;
    return data;
  }
}

class LoginResp {
  String? token;
  User? user;

  LoginResp({required this.token, required this.user});

  LoginResp.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? createAt;
  int? id;
  String? username;

  User({this.createAt, this.id, this.username});

  User.fromJson(Map<String, dynamic> json) {
    createAt = json['create_at'];
    id = json['id'];
    username = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['create_at'] = createAt;
    data['id'] = id;
    data['user_name'] = username;
    return data;
  }
}
