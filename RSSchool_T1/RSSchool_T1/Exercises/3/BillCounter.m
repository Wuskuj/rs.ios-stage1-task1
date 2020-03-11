#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSInteger sumWithoutAnna = 0;
    NSInteger newSum = sum.intValue;
    for (int i = 0; i < bill.count; i++) {
        if (i != index) {
            NSNumber *num = bill[i];
            sumWithoutAnna += num.intValue;
        }
    }
    
    NSInteger billForAnna = sumWithoutAnna / 2;
    
    if (newSum > billForAnna) {
        NSInteger finalSum = newSum - billForAnna;
        return [NSString stringWithFormat:@"%ld", (long)finalSum];
    }else {
        return @"Bon Appetit";
    }
}

@end
