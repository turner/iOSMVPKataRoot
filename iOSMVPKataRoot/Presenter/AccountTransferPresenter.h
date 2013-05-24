#import <Foundation/Foundation.h>

@protocol ILocalAccountRepository;
@protocol IRemoteAccountRepository;
@protocol IAccountTransferView;

@interface AccountTransferPresenter : NSObject
- (id)initWithLocal:(id <ILocalAccountRepository>)localRepository remote:(id <IRemoteAccountRepository>)remoteRepository;
@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;

- (void)transferAmount;

@end