#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSInteger firstMinSum = 0;
    NSInteger secondMinSum = 0;
    NSInteger secondMaxSum = 0;
    BOOL flag = false;
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; j < array.count; j++) {
            if (j != i) {
                NSNumber *numb = array[j];
                NSInteger number = numb.intValue;
                firstMinSum += number;
            }
            else {
                continue;
            }
        }
        if (!flag) {
            secondMinSum = firstMinSum;
            flag = true;
        }
        secondMinSum = secondMinSum < firstMinSum ? secondMinSum : firstMinSum;
        secondMaxSum = secondMaxSum > firstMinSum ? secondMaxSum : firstMinSum;
        firstMinSum = 0;
    }
    NSNumber *min = [NSNumber numberWithInteger:secondMinSum];
    NSNumber *max = [NSNumber numberWithInteger:secondMaxSum];
    NSArray<NSNumber*> *resultArray = [NSArray arrayWithObjects:min,max,nil];
    return resultArray;
}

@end
