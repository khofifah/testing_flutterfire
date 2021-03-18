class Login {
  final String nama, email;

  Login({
    this.nama,
    this.email,
  });

  factory Login.fromString(String dataNama, String dataEmail) {
    return Login(
      nama: dataNama,
      email: dataEmail,
    );
  }

  factory Login.fromMap(Map<String, dynamic> data) {
    return Login(
      nama: data['nama'],
      email: data['email'],
    );
  }

  Map toMap(Login login) {
    var data = Map<String, dynamic>();
    data['email'] = login.email;
    data['nama'] = login.nama;
    return data;
  }
}
