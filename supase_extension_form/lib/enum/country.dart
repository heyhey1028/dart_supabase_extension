enum Country {
  us(name: 'United States', code: 'US'),
  canada(name: 'Canada', code: 'CA'),
  mexico(name: 'Mexico', code: 'MX'),
  uk(name: 'United Kingdom', code: 'GB'),
  france(name: 'France', code: 'FR'),
  germany(name: 'Germany', code: 'DE'),
  italy(name: 'Italy', code: 'IT'),
  spain(name: 'Spain', code: 'ES'),
  china(name: 'China', code: 'CN');

  final String name;
  final String code;

  const Country({required this.name, required this.code});
}
