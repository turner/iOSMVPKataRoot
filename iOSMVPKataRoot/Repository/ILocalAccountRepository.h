#import <Foundation/Foundation.h>

@protocol ILocalAccountRepository <NSObject>

@required
- (void)depositAmount:(NSNumber *)amount;
@end