#import <Foundation/Foundation.h>

@protocol IRemoteAccountRepository <NSObject>

@required
- (void)withdrawAmount:(NSNumber *)amount;
@end