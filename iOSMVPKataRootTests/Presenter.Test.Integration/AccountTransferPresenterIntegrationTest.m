#import <SenTestingKit/SenTestingKit.h>
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "OCMockRecorder.h"
#import "ILocalAccountRepository.h"
#import "LocalAccountRepository.h"
#import "IRemoteAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "AccountTransferPresenter.h"

@interface AccountTransferPresenterIntegrationTest : SenTestCase

@end

@implementation AccountTransferPresenterIntegrationTest

-(void)testGivenAccountTransferPresenter_WhenGetTransferAmountIsRequested_ThenAllProtocolsAreCalled {

    // create mocks/stubs
    id accountTransferViewStub = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];

    NSNumber *amount = @150.0;
    [[[accountTransferViewStub stub] andReturn:amount] getTransferAmount];

    // set expectations
    [[accountTransferViewStub expect] setDisplayMessage:@"$150 transferred."];

    // instantiate presenter with injected dependencies
    id<ILocalAccountRepository>localAccountRepository = [[LocalAccountRepository alloc] init];
    id<IRemoteAccountRepository>remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithLocal:localAccountRepository remote:remoteAccountRepository];
    sut.accountTransferView = accountTransferViewStub;

    [sut transferAmount];

    // verify test
    [accountTransferViewStub verify];

}

@end
