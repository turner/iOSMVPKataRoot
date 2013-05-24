#import "RemoteAccountRepository.h"

@implementation RemoteAccountRepository {

}

- (void)withdrawAmount:(NSNumber *)amount {
    NSLog(@"%@ withdraw $%@", [self class], amount);
}

@end