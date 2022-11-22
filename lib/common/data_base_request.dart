abstract class DataBaseRequest {
  static const String tableRole = 'role';
  static const String tableUser = 'user';
  static const String tableProduct = 'product';
  static const String tableSklad = 'sklad';
  static const String tableAddress = 'adress';
  static const String tableColor = 'color';
  static const String tableCountry = 'country';
  static const String tableType = 'type';
  static const String tableCheck = 'check';
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableProduct,
    tableSklad,
    tableAddress,
    tableColor,
    tableCountry,
    tableType,
    tableCheck
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableSklad,
    _createTableAdress,
    _createTableUsers,
    _createTableCountry,
    _createTableType,
    _createTableCheck,
    _createTableColor,
    _createTableProduct
  ];

  static const String _createTableRole = '''CREATE TABLE "$tableRole" (
        "id_role" INTEGER,
        "name" TEXT NOT NULL UNIQUE, 
        PRIMARY KEY("id_role" AUTOINCREMENT))''';

  static const String _createTableUsers = '''CREATE TABLE "$tableUser" (
        "id_user"	INTEGER,
        "login"	TEXT NOT NULL UNIQUE,
        "password"	TEXT NOT NULL,
        "id_role"	INTEGER,
        FOREIGN KEY("id_role") REFERENCES "$tableRole"("id_role") ON DELETE CASCADE,
        PRIMARY KEY("id_user" AUTOINCREMENT) )''';
  static const String _createTableSklad = '''CREATE TABLE "$tableSklad" (
        "id_sklad"  INTEGER,
        "name"	TEXT NOT NULL,
        "id_adress" INTEGER NOT NULL,
        "id_user" INTEGER NOT NULL,
        FOREIGN KEY("id_user") REFERENCES "$tableUser"("id_user") ON DELETE CASCADE,
        FOREIGN KEY("id_adress") REFERENCES "$tableAddress"("id_adress") ON DELETE CASCADE,
        PRIMARY KEY("id_sklad" AUTOINCREMENT) )
        ''';

  static const String _createTableAdress = '''CREATE TABLE "$tableAddress" (
        "id_adress"	INTEGER,
        "name"	TEXT NOT NULL,
        PRIMARY KEY("id_adress" AUTOINCREMENT) )
        ''';

  static const String _createTableProduct = '''CREATE TABLE "$tableProduct" (
        "id_product" INTEGER NOT NULL,
        "name" TEXT NOT NULL,
        "id_country" INTEGER NOT NULL,
        "id_type" INTEGER NOT NULL,
        "id_color" INTEGER NOT NULL,
        "id_sklad" INTEGER NOT NULL,
        FOREIGN KEY("id_country") REFERENCES "$tableCountry"("id_country") ON DELETE CASCADE,
        FOREIGN KEY("id_type") REFERENCES "$tableType"("id_type") ON DELETE CASCADE,
        FOREIGN KEY("id_color") REFERENCES "$tableColor"("id_color") ON DELETE CASCADE,
        FOREIGN KEY("id_sklad") REFERENCES "$tableSklad"("id_sklad") ON DELETE CASCADE,
        PRIMARY KEY("id_product" AUTOINCREMENT) )''';

  static const String _createTableColor = '''CREATE TABLE "$tableColor" (
        "id_color"	INTEGER,
        "name"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("id_color" AUTOINCREMENT) )''';
  static const String _createTableCheck = '''CREATE TABLE "$tableCheck" (
        "id_check"	INTEGER,
        "data"	DATE NOT NULL,
        "id_product" INTEGER NOT NULL,
        FOREIGN KEY("id_product") REFERENCES "$tableProduct"("id_product") ON DELETE CASCADE,
        PRIMARY KEY("id_check" AUTOINCREMENT) )''';

  static const String _createTableType = '''CREATE TABLE "$tableType" (
        "id_Type"	INTEGER NOT NULL ,
        "name" TEXT NOT NULL,
        PRIMARY KEY("id_Type" AUTOINCREMENT) )''';

  static const String _createTableCountry = '''CREATE TABLE "$tableCountry" (
        "id_country"	INTEGER,
        "name"	TEXT NOT NULL,
        PRIMARY KEY("id_country" AUTOINCREMENT) )''';
}
