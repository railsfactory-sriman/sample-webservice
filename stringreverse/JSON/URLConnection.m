

#import "URLConnection.h"
//#import "MeetViewController.h"//akp
@implementation URLConnection
@synthesize delgateObject,urlData;
@synthesize setIdentifier;

#pragma mark - Initiate Reqest

- (id) initWithMethodNameRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg identifier:(NSString *)checkIdentity{
    self = [super initWithRequest:requestArg delegate:self];
    setIdentifier=checkIdentity;
    if (self != nil) {
        self.delgateObject=delegateArg;
    }
    return self;
}

- (id) initWithMethodRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg{
    self = [super initWithRequest:requestArg delegate:self];
    if (self != nil) {
        self.delgateObject=delegateArg;
    }
    return self;
}

#pragma mark - NSURLConnection Delegates

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
   /* if ([setIdentifier isEqualToString:@"activityList"]) {
        //[self.delgateObject performSelectorInBackground:@selector(receivedActivityListData:) withObject:urlData];
        [self.delgateObject receivedActivityListData:urlData];
    }
    else if ([setIdentifier isEqualToString:@"sync"])
    {
     //[self.delgateObject performSelectorInBackground:@selector(receivedSyncData:) withObject:urlData];
    [self.delgateObject receivedSyncData:urlData];
        
    }
    else if ([setIdentifier isEqualToString:@"getSetCommunities"])
    {
      //[self.delgateObject performSelectorInBackground:@selector(receivedCommunityData:) withObject:urlData];
        
     [self.delgateObject receivedCommunityData:urlData];
    }
    else 
    {
        [self.delgateObject receivedData:urlData];
    }*/
    [self.delgateObject receivedData:urlData];
}



- (void)connection:(NSURLConnection *)connection didFailWithError:
(NSError *)error 
{
    //NSLog(@"Error:%@",error);
    NSString *localerror=[error localizedDescription];
    NSString *strerror=NSLocalizedString(localerror, nil);
    NSLog(@"str err%@",strerror);
 /*   [Utils hideAlert];
    
    [Utils showAlertMessage:strerror];
    if ([setIdentifier isEqualToString:@"activityList"] || [setIdentifier isEqualToString:@"sync"] || [setIdentifier isEqualToString:@"getSetCommunities"]) {
        [self.delgateObject lostInternetConnectivity];
    }
    */ //akp
    

	self.delgateObject=nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	if(!urlData){
        urlData = [[NSMutableData alloc] init];
        [urlData setLength:0];       
    }
    [urlData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[urlData setLength:0];
}

#pragma mark - Memory Management

-(void)dealloc{
    [setIdentifier release];
	[urlData release];
	[delgateObject release];
	[super dealloc];
}
@end
