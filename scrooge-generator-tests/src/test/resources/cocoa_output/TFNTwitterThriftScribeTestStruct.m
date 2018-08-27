/**
 * Generated by Scrooge
 *   version: ?
 *   rev: ?
 *   built at: ?
 */
#import "TFNTwitterThriftScribeTestStruct.h"

@import ApacheThrift;

@implementation TFNTwitterThriftScribeTestStruct

- (NSString*)description
{
    NSMutableString* ms = [NSMutableString stringWithString:@"TFNTwitterThriftScribeTestStruct( "];
    [ms appendString:@"name:"];
    [ms appendFormat:@"%@ ", _name];
    [ms appendString:@"values:"];
    [ms appendFormat:@"%@ ", _values];
    [ms appendString:@"price:"];
    [ms appendFormat:@"%@ ", @(_price)];
    [ms appendString:@")"];
    return [NSString stringWithString:ms];
}

- (instancetype)initWithName:(NSString *)name values:(NSSet *)values price:(int32_t)price
{
    if (self = [super init]) {
        [self setName:name];
        [self setValues:values];
        [self setPrice:price];
    }

    return self;
}

+ (instancetype)instanceWithName:(NSString *)name values:(NSSet *)values price:(int32_t)price error:(NSError **)error
{
    TFNTwitterThriftScribeTestStruct *instance = [[TFNTwitterThriftScribeTestStruct alloc] initWithName:name values:values price:price];
    if (error) {
        NSArray *invalidFields = [instance validateNonOptionalFields];
        if (invalidFields.count > 0) {
            NSString *errorDescription = [NSString stringWithFormat:@"Required fields not set: %@", invalidFields];
            *error = [NSError errorWithDomain:@"com.twitter.scrooge.backend.CocoaGenerator" code:0 userInfo:@{NSLocalizedDescriptionKey: errorDescription}];
        }
    }
    return instance;
}

- (instancetype)initWithCoder:(NSCoder*)decoder
{
    if (self = [super init]) {
        if ([decoder containsValueForKey:@"1"]) {
            [self setName:(NSString *)[decoder decodeObjectForKey:@"1"]];
        }
        if ([decoder containsValueForKey:@"2"]) {
            [self setValues:(NSSet *)[decoder decodeObjectForKey:@"2"]];
        }
        if ([decoder containsValueForKey:@"3"]) {
            [self setPrice:(int32_t)[decoder decodeInt32ForKey:@"3"]];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    if (_nameIsSet) {
        [encoder encodeObject:_name forKey:@"1"];
    }
    if (_valuesIsSet) {
        [encoder encodeObject:_values forKey:@"2"];
    }
    if (_priceIsSet) {
        [encoder encodeInt32:_price forKey:@"3"];
    }
}

- (void)setName:(NSString *)name
{
    _name = [name copy];
    _nameIsSet = name != nil;
}

- (void)setValues:(NSSet *)values
{
    _values = [values copy];
    _valuesIsSet = values != nil;
}

- (void)setPrice:(int32_t)price
{
    _price = price;
    _priceIsSet = YES;
}

- (void)read:(id <TProtocol>)inProtocol
{
    NSString* fieldName;
    int fieldType;
    int fieldID;

    [inProtocol readStructBeginReturningName:nil];
    while (true) {
        [inProtocol readFieldBeginReturningName:&fieldName type:&fieldType fieldID:&fieldID];
        if (fieldType == TType_STOP) {
            break;
        }
        switch (fieldID) {
            case 1:
                if (fieldType == TType_STRING) {
                    NSString * name_item;
                    name_item = [inProtocol readString];
                    [self setName:name_item];
                } else {
                    NSLog(@"%s: field ID %i has unexpected type %i.  Skipping.", __PRETTY_FUNCTION__, fieldID, fieldType);
                    [TProtocolUtil skipType:fieldType onProtocol:inProtocol];
                }
                break;
            case 2:
                if (fieldType == TType_SET) {
                    NSSet * values_item;
                    int _values_item_size;
                    [inProtocol readSetBeginReturningElementType: NULL size: &_values_item_size];
                    NSUInteger _values_item_capacity= _values_item_size < 0 ? 0 : (NSUInteger)_values_item_size;
                    NSMutableSet *values_item_mutable = [[NSMutableSet alloc] initWithCapacity:_values_item_capacity];
                    for (int _values_item_i = 0; _values_item_i < _values_item_size; ++_values_item_i) {
                        NSString * values_item_element;
                        values_item_element = [inProtocol readString];
                        [values_item_mutable addObject: values_item_element];
                    }
                    values_item = values_item_mutable;
                    [inProtocol readSetEnd];
                    [self setValues:values_item];
                } else {
                    NSLog(@"%s: field ID %i has unexpected type %i.  Skipping.", __PRETTY_FUNCTION__, fieldID, fieldType);
                    [TProtocolUtil skipType:fieldType onProtocol:inProtocol];
                }
                break;
            case 3:
                if (fieldType == TType_I32) {
                    int32_t price_item;
                    price_item = [inProtocol readI32];
                    [self setPrice:price_item];
                } else {
                    NSLog(@"%s: field ID %i has unexpected type %i.  Skipping.", __PRETTY_FUNCTION__, fieldID, fieldType);
                    [TProtocolUtil skipType:fieldType onProtocol:inProtocol];
                }
                break;
        default:
            NSLog(@"%s: unexpected field ID %i with type %i.  Skipping.", __PRETTY_FUNCTION__, fieldID, fieldType);
            [TProtocolUtil skipType:fieldType onProtocol:inProtocol];
            break;
        }
        [inProtocol readFieldEnd];
    }
    [inProtocol readStructEnd];
    [self validate];
}

- (void)write:(id <TProtocol>)outProtocol
{
    [self validate];
    [outProtocol writeStructBeginWithName:@"TFNTwitterThriftScribeTestStruct"];
    if (_nameIsSet) {
        [outProtocol writeFieldBeginWithName:@"name" type:TType_STRING fieldID:1];
        NSString * name_item = _name;
        [outProtocol writeString:name_item];
        [outProtocol writeFieldEnd];
    }
    if (_valuesIsSet) {
        [outProtocol writeFieldBeginWithName:@"values" type:TType_SET fieldID:2];
        NSSet * values_item = _values;
        [outProtocol writeSetBeginWithElementType:TType_STRING size:(int)[values_item count]];
        for (id values_item_element in values_item) {
            [outProtocol writeString:values_item_element];
        }
        [outProtocol writeSetEnd];
        [outProtocol writeFieldEnd];
    }
    if (_priceIsSet) {
        [outProtocol writeFieldBeginWithName:@"price" type:TType_I32 fieldID:3];
        int32_t price_item = _price;
        [outProtocol writeI32:price_item];
        [outProtocol writeFieldEnd];
    }
    [outProtocol writeFieldStop];
    [outProtocol writeStructEnd];
}

- (void)validate
{
}

- (NSArray *)validateNonOptionalFields
{
    NSMutableArray *invalidFields = [NSMutableArray array];
    if (!_nameIsSet) {
        [invalidFields addObject:@"name"];
    }
    if (!_valuesIsSet) {
        [invalidFields addObject:@"values"];
    }
    if (!_priceIsSet) {
        [invalidFields addObject:@"price"];
    }
    return [invalidFields copy];
}

@end