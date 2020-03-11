#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableString *resultString = [NSMutableString stringWithString:s];

    NSInteger nNew = n.intValue;
    NSInteger kNew = k.intValue;
    
    
    unichar charSymbolFirst;
    unichar charSymbolSecond;
    NSInteger newCount = nNew - 1;
    NSInteger countOfOperationNew = 0;
    NSString *resString = @"";
    
    
    for (int i = 0; i < nNew; i++) {
        charSymbolFirst = [resultString characterAtIndex:i];
        charSymbolSecond = [resultString characterAtIndex:newCount];
        if (charSymbolFirst == charSymbolSecond) {
            if (i + 1 == newCount) {
                break;
            }
            newCount--;
            continue;
        }
        NSNumber *numberFirst = [NSNumber numberWithChar:charSymbolFirst];
        NSNumber *numberSecond = [NSNumber numberWithChar:charSymbolSecond];
        NSInteger tempFirst = numberFirst.intValue - 48;
        NSInteger tempSecond = numberSecond.intValue - 48;
        
        NSString *strOne = [NSString stringWithFormat:@"%ld", tempFirst];
        NSString *strTwo = [NSString stringWithFormat:@"%ld", tempSecond];
        
        
        if (tempFirst < tempSecond) {
            NSRange range = NSMakeRange(i, 1);
            resString = [resultString stringByReplacingCharactersInRange:range withString:strTwo];
        }else {
            NSRange range = NSMakeRange(newCount, 1);
            resString = [resultString stringByReplacingCharactersInRange:range withString:strOne];
        }
        resultString = [NSMutableString stringWithString:resString];
        
        
        if (countOfOperationNew >= kNew) {
            return @"-1";
            break;
        }
        countOfOperationNew++;
        newCount--;
    }
    
    newCount = nNew - 1;
    
    for (int i = 0; i < nNew; i++) {
        NSRange rangeOne = NSMakeRange(i, 1);
        NSRange rangeTwo = NSMakeRange(newCount, 1);
        if (countOfOperationNew >= kNew) {
            break;
        }
        resultString = [resultString stringByReplacingCharactersInRange:rangeOne withString:@"9"];
        resultString = [resultString stringByReplacingCharactersInRange:rangeTwo withString:@"9"];
        countOfOperationNew++;
    }

    return resultString;
}

@end
