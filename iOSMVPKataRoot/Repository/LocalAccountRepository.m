#import "LocalAccountRepository.h"

@implementation LocalAccountRepository {

}
- (void)depositAmount:(NSNumber *)amount {

    NSLog(@"%@ deposit $%@", [self class], amount);
}

@end