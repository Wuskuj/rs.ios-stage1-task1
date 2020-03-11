#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *array = [NSMutableArray arrayWithArray:sadArray];
    for (int i = 0; i < array.count; i++) {
        if (i == array.count - 1) {
            break;
        }
        if (i != 0) {
            NSNumber *mid = array[i];
            NSNumber *one = array[i - 1];
            NSNumber *two = array[i + 1];
            NSInteger sum = one.intValue + two.intValue;
            if (mid.intValue > sum) {
                [array removeObjectAtIndex:i];
                i = -1;
            }
        }
    }
    return array;
}

@end
