// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_receipt.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetSavedReceiptCollection on Isar {
  IsarCollection<SavedReceipt> get savedReceipts => this.collection();
}

const SavedReceiptSchema = CollectionSchema(
  name: r'SavedReceipt',
  id: 3238629337167706701,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(id: 1, name: r'date', type: IsarType.string),
    r'discount': PropertySchema(id: 2, name: r'discount', type: IsarType.long),
    r'itemCount': PropertySchema(
      id: 3,
      name: r'itemCount',
      type: IsarType.long,
    ),
    r'needsCheck': PropertySchema(
      id: 4,
      name: r'needsCheck',
      type: IsarType.bool,
    ),
    r'payMethod': PropertySchema(
      id: 5,
      name: r'payMethod',
      type: IsarType.string,
    ),
    r'store': PropertySchema(id: 6, name: r'store', type: IsarType.string),
    r'sum': PropertySchema(id: 7, name: r'sum', type: IsarType.long),
    r'tax': PropertySchema(id: 8, name: r'tax', type: IsarType.long),
    r'time': PropertySchema(id: 9, name: r'time', type: IsarType.string),
    r'total': PropertySchema(id: 10, name: r'total', type: IsarType.long),
  },

  estimateSize: _savedReceiptEstimateSize,
  serialize: _savedReceiptSerialize,
  deserialize: _savedReceiptDeserialize,
  deserializeProp: _savedReceiptDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _savedReceiptGetId,
  getLinks: _savedReceiptGetLinks,
  attach: _savedReceiptAttach,
  version: '3.4.1',
);

int _savedReceiptEstimateSize(
  SavedReceipt object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.payMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.store;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.time;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _savedReceiptSerialize(
  SavedReceipt object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.date);
  writer.writeLong(offsets[2], object.discount);
  writer.writeLong(offsets[3], object.itemCount);
  writer.writeBool(offsets[4], object.needsCheck);
  writer.writeString(offsets[5], object.payMethod);
  writer.writeString(offsets[6], object.store);
  writer.writeLong(offsets[7], object.sum);
  writer.writeLong(offsets[8], object.tax);
  writer.writeString(offsets[9], object.time);
  writer.writeLong(offsets[10], object.total);
}

SavedReceipt _savedReceiptDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedReceipt();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.date = reader.readStringOrNull(offsets[1]);
  object.discount = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.itemCount = reader.readLongOrNull(offsets[3]);
  object.needsCheck = reader.readBool(offsets[4]);
  object.payMethod = reader.readStringOrNull(offsets[5]);
  object.store = reader.readStringOrNull(offsets[6]);
  object.sum = reader.readLongOrNull(offsets[7]);
  object.tax = reader.readLongOrNull(offsets[8]);
  object.time = reader.readStringOrNull(offsets[9]);
  object.total = reader.readLongOrNull(offsets[10]);
  return object;
}

P _savedReceiptDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedReceiptGetId(SavedReceipt object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedReceiptGetLinks(SavedReceipt object) {
  return [];
}

void _savedReceiptAttach(
  IsarCollection<dynamic> col,
  Id id,
  SavedReceipt object,
) {
  object.id = id;
}

extension SavedReceiptQueryWhereSort
    on QueryBuilder<SavedReceipt, SavedReceipt, QWhere> {
  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavedReceiptQueryWhere
    on QueryBuilder<SavedReceipt, SavedReceipt, QWhereClause> {
  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'date', value: [null]),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'date',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> dateEqualTo(
    String? date,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'date', value: [date]),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterWhereClause> dateNotEqualTo(
    String? date,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension SavedReceiptQueryFilter
    on QueryBuilder<SavedReceipt, SavedReceipt, QFilterCondition> {
  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'date'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'date'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  dateStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> dateContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> dateMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'date',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  discountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'discount'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  discountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'discount'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  discountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'discount', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  discountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'discount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  discountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'discount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  discountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'discount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  itemCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'itemCount'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  itemCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'itemCount'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  itemCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemCount', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  itemCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  itemCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  itemCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  needsCheckEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'needsCheck', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'payMethod'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'payMethod'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'payMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'payMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'payMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'payMethod',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'payMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'payMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'payMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'payMethod',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'payMethod', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  payMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'payMethod', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  storeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'store'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  storeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'store'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> storeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'store',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  storeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'store',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> storeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'store',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> storeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'store',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  storeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'store',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> storeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'store',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> storeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'store',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> storeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'store',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  storeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'store', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  storeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'store', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> sumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sum'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  sumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sum'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> sumEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sum', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  sumGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sum',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> sumLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sum',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> sumBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sum',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> taxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tax'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  taxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tax'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> taxEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tax', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  taxGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tax',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> taxLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tax',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> taxBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'time'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'time'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> timeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  timeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> timeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> timeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'time',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  timeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> timeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> timeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'time',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'time', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'time', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'total'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'total'),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> totalEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'total', value: value),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition>
  totalGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'total',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'total',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterFilterCondition> totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'total',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SavedReceiptQueryObject
    on QueryBuilder<SavedReceipt, SavedReceipt, QFilterCondition> {}

extension SavedReceiptQueryLinks
    on QueryBuilder<SavedReceipt, SavedReceipt, QFilterCondition> {}

extension SavedReceiptQuerySortBy
    on QueryBuilder<SavedReceipt, SavedReceipt, QSortBy> {
  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByItemCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByNeedsCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsCheck', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy>
  sortByNeedsCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsCheck', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByPayMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payMethod', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByPayMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payMethod', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension SavedReceiptQuerySortThenBy
    on QueryBuilder<SavedReceipt, SavedReceipt, QSortThenBy> {
  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByItemCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByNeedsCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsCheck', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy>
  thenByNeedsCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsCheck', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByPayMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payMethod', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByPayMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payMethod', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension SavedReceiptQueryWhereDistinct
    on QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> {
  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByDate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCount');
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByNeedsCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsCheck');
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByPayMethod({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payMethod', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByStore({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'store', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sum');
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tax');
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedReceipt, SavedReceipt, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension SavedReceiptQueryProperty
    on QueryBuilder<SavedReceipt, SavedReceipt, QQueryProperty> {
  QueryBuilder<SavedReceipt, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedReceipt, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SavedReceipt, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<SavedReceipt, int?, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<SavedReceipt, int?, QQueryOperations> itemCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCount');
    });
  }

  QueryBuilder<SavedReceipt, bool, QQueryOperations> needsCheckProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsCheck');
    });
  }

  QueryBuilder<SavedReceipt, String?, QQueryOperations> payMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payMethod');
    });
  }

  QueryBuilder<SavedReceipt, String?, QQueryOperations> storeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'store');
    });
  }

  QueryBuilder<SavedReceipt, int?, QQueryOperations> sumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sum');
    });
  }

  QueryBuilder<SavedReceipt, int?, QQueryOperations> taxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tax');
    });
  }

  QueryBuilder<SavedReceipt, String?, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<SavedReceipt, int?, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetSavedReceiptItemCollection on Isar {
  IsarCollection<SavedReceiptItem> get savedReceiptItems => this.collection();
}

const SavedReceiptItemSchema = CollectionSchema(
  name: r'SavedReceiptItem',
  id: -1943862094610560519,
  properties: {
    r'item': PropertySchema(id: 0, name: r'item', type: IsarType.string),
    r'price': PropertySchema(id: 1, name: r'price', type: IsarType.long),
    r'quantity': PropertySchema(id: 2, name: r'quantity', type: IsarType.long),
    r'receiptId': PropertySchema(
      id: 3,
      name: r'receiptId',
      type: IsarType.long,
    ),
    r'taxRate': PropertySchema(id: 4, name: r'taxRate', type: IsarType.long),
    r'unitPrice': PropertySchema(
      id: 5,
      name: r'unitPrice',
      type: IsarType.long,
    ),
  },

  estimateSize: _savedReceiptItemEstimateSize,
  serialize: _savedReceiptItemSerialize,
  deserialize: _savedReceiptItemDeserialize,
  deserializeProp: _savedReceiptItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'receiptId': IndexSchema(
      id: 5666094434830883054,
      name: r'receiptId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'receiptId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _savedReceiptItemGetId,
  getLinks: _savedReceiptItemGetLinks,
  attach: _savedReceiptItemAttach,
  version: '3.4.1',
);

int _savedReceiptItemEstimateSize(
  SavedReceiptItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.item.length * 3;
  return bytesCount;
}

void _savedReceiptItemSerialize(
  SavedReceiptItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.item);
  writer.writeLong(offsets[1], object.price);
  writer.writeLong(offsets[2], object.quantity);
  writer.writeLong(offsets[3], object.receiptId);
  writer.writeLong(offsets[4], object.taxRate);
  writer.writeLong(offsets[5], object.unitPrice);
}

SavedReceiptItem _savedReceiptItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedReceiptItem();
  object.id = id;
  object.item = reader.readString(offsets[0]);
  object.price = reader.readLong(offsets[1]);
  object.quantity = reader.readLongOrNull(offsets[2]);
  object.receiptId = reader.readLong(offsets[3]);
  object.taxRate = reader.readLongOrNull(offsets[4]);
  object.unitPrice = reader.readLongOrNull(offsets[5]);
  return object;
}

P _savedReceiptItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedReceiptItemGetId(SavedReceiptItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedReceiptItemGetLinks(SavedReceiptItem object) {
  return [];
}

void _savedReceiptItemAttach(
  IsarCollection<dynamic> col,
  Id id,
  SavedReceiptItem object,
) {
  object.id = id;
}

extension SavedReceiptItemQueryWhereSort
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QWhere> {
  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhere> anyReceiptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'receiptId'),
      );
    });
  }
}

extension SavedReceiptItemQueryWhere
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QWhereClause> {
  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  receiptIdEqualTo(int receiptId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'receiptId', value: [receiptId]),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  receiptIdNotEqualTo(int receiptId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'receiptId',
                lower: [],
                upper: [receiptId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'receiptId',
                lower: [receiptId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'receiptId',
                lower: [receiptId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'receiptId',
                lower: [],
                upper: [receiptId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  receiptIdGreaterThan(int receiptId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'receiptId',
          lower: [receiptId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  receiptIdLessThan(int receiptId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'receiptId',
          lower: [],
          upper: [receiptId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterWhereClause>
  receiptIdBetween(
    int lowerReceiptId,
    int upperReceiptId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'receiptId',
          lower: [lowerReceiptId],
          includeLower: includeLower,
          upper: [upperReceiptId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SavedReceiptItemQueryFilter
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QFilterCondition> {
  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'item',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'item',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'item',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'item',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'item',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'item',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'item',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'item',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'item', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  itemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'item', value: ''),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  priceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'price', value: value),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  priceGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'price',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  priceLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'price',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  priceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'price',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'quantity'),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'quantity'),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quantity', value: value),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  quantityGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  quantityLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quantity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  receiptIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'receiptId', value: value),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  receiptIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'receiptId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  receiptIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'receiptId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  receiptIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'receiptId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  taxRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'taxRate'),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  taxRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'taxRate'),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  taxRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'taxRate', value: value),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  taxRateGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'taxRate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  taxRateLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'taxRate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  taxRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'taxRate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  unitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'unitPrice'),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  unitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'unitPrice'),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  unitPriceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unitPrice', value: value),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  unitPriceGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unitPrice',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  unitPriceLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unitPrice',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterFilterCondition>
  unitPriceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unitPrice',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SavedReceiptItemQueryObject
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QFilterCondition> {}

extension SavedReceiptItemQueryLinks
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QFilterCondition> {}

extension SavedReceiptItemQuerySortBy
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QSortBy> {
  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy> sortByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByReceiptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptId', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByReceiptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptId', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension SavedReceiptItemQuerySortThenBy
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QSortThenBy> {
  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy> thenByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByReceiptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptId', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByReceiptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptId', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.desc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QAfterSortBy>
  thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension SavedReceiptItemQueryWhereDistinct
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QDistinct> {
  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QDistinct> distinctByItem({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'item', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QDistinct>
  distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QDistinct>
  distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QDistinct>
  distinctByReceiptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiptId');
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QDistinct>
  distinctByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxRate');
    });
  }

  QueryBuilder<SavedReceiptItem, SavedReceiptItem, QDistinct>
  distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }
}

extension SavedReceiptItemQueryProperty
    on QueryBuilder<SavedReceiptItem, SavedReceiptItem, QQueryProperty> {
  QueryBuilder<SavedReceiptItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedReceiptItem, String, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<SavedReceiptItem, int, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<SavedReceiptItem, int?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<SavedReceiptItem, int, QQueryOperations> receiptIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiptId');
    });
  }

  QueryBuilder<SavedReceiptItem, int?, QQueryOperations> taxRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxRate');
    });
  }

  QueryBuilder<SavedReceiptItem, int?, QQueryOperations> unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }
}
