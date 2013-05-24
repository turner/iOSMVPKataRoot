#import "AccountTransferPresenter.h"
#import "ILocalAccountRepository.h"
#import "IRemoteAccountRepository.h"
#import "IAccountTransferView.h"

@implementation AccountTransferPresenter {

    id <ILocalAccountRepository> _localRepository;
    id <IRemoteAccountRepository> _remoteRepository;
}

- (id)initWithLocal:(id <ILocalAccountRepository>)localRepository remote:(id <IRemoteAccountRepository>)remoteRepository {
    
    self = [super init];
    
    if (nil != self) {

        _localRepository = localRepository;
        _remoteRepository = remoteRepository;
    }
    
    return self;

}

@end