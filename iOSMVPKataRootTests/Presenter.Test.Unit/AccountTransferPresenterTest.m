#import <SenTestingKit/SenTestingKit.h>
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "OCMockRecorder.h"
#import "AccountTransferPresenter.h"

@interface AccountTransferPresenterTest : SenTestCase

@end

@implementation AccountTransferPresenterTest

- (void)GivenAccountTransferPresenter_WhenGetTransferAmmountIsRequested_ThenAllProtocolsAreCalled {

    // create mocks
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    // set expectations
    NSNumber *amount = @150.0;
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];

    [[remoteAccountRepository expect] withdrawAmount:amount];

    [[localAccountRepository expect] depositAmount:amount];

    [[accountTransferView expect] setDisplayMessage:@"$150 transferred."];

    // instantiate presenter with injected dependencies
    AccountTransferPresenter *accountTransferPresenter = [[AccountTransferPresenter alloc] initWithLocal:localAccountRepository remote:remoteAccountRepository];
    accountTransferPresenter.view = accountTransferView;
    
    // verify test

}

@end
