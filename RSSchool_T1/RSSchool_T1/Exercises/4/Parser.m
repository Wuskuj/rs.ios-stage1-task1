#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    unichar findC;
    unichar findY;
    NSInteger firstElement = 0;
    NSInteger lastElement = 0;
    NSInteger count = 0;
    NSMutableArray *arrayString = [NSMutableArray new];
    
    for(int i = 0; i < string.length; i++) {
        findC = [string characterAtIndex:i];
        if(findC == '<') {
            firstElement = i + 1;
            for (int j = i; i < string.length; j++) {
                findY = [string characterAtIndex:j + 1];
                if (findY == '<') {
                    count++;
                }
                if (findY == '>') {
                    if (count != 0) {
                        count--;
                        continue;
                    }
                    lastElement = j - firstElement + 1;
                    NSRange range = NSMakeRange(firstElement, lastElement);
                    NSString *stringRange = [string substringWithRange:range];
                    [arrayString addObject:stringRange];
                    break;
                    
                }
            }
        }
        
        if(findC == '(') {
            firstElement = i + 1;
            for (int j = i; i < string.length; j++) {
                findY = [string characterAtIndex:j];
                if (findY == ')') {
                    lastElement = j - firstElement;
                    NSRange range = NSMakeRange(firstElement, lastElement);
                    NSString *stringRange = [string substringWithRange:range];
                    [arrayString addObject:stringRange];
                    i = i + 1;
                    break;
                   
                }
            }
        }
        
        if(findC == '[') {
            firstElement = i + 1;
            for (int j = i; i < string.length; j++) {
                findY = [string characterAtIndex:j];
                if (findY == ']') {
                    lastElement = j - firstElement;
                    NSRange range = NSMakeRange(firstElement, lastElement);
                    NSString *stringRange = [string substringWithRange:range];
                    [arrayString addObject:stringRange];
                    i = i + 1;
                    break;
                }
            }
        }
    }
    return arrayString;
}

@end
