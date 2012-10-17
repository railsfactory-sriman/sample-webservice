
#import "RestCall.h"
//#import "Reachability.h"
#import "Constants.h"
#import "JSONInterface.h"
@implementation NSURLRequest(DataController)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
	return YES; 
}
@end

@implementation RestCall

NSMutableURLRequest *theRequest;

#pragma mark - Genearate Request

+(NSMutableURLRequest *)syncRequest :(NSMutableArray *) methodName{
    
    NSString *access_token =  [[NSUserDefaults standardUserDefaults]
                               stringForKey:@"access_key"];
    
    NSMutableDictionary *resultDic =[NSMutableDictionary dictionary];
    [resultDic setObject:methodName forKey:@"user"];
    JSONInterface *jsonInterface = [[JSONInterface alloc]init];
	NSString *jsonMsg = [jsonInterface encodeRequest:resultDic];
    [jsonInterface release];
    NSString *urlString=[synchronisation stringByAppendingFormat:@"%@",access_token];
    //NSLog(@"THE URL :%@",urlString);
    NSURL *urlStrings = [NSURL URLWithString:urlString];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [jsonMsg length]];
    theRequest = [NSMutableURLRequest requestWithURL:urlStrings];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [jsonMsg dataUsingEncoding:NSUTF8StringEncoding]];	   
    
	return theRequest;
}


+(NSMutableURLRequest *)communitySync:(NSMutableArray *)communityDetails
{
    NSMutableDictionary *resultDic =[NSMutableDictionary dictionary];
    [resultDic setValue:communityDetails forKey:@"communities"];
    JSONInterface *jsonInterface = [[JSONInterface alloc]init];
	NSString *jsonMsg = [jsonInterface encodeRequest:resultDic];
    [jsonInterface release];
    NSString *access_token =  [[NSUserDefaults standardUserDefaults]
                               stringForKey:@"access_key"];
    NSString *urlString=[communitySynchronisation stringByAppendingFormat:@"%@",access_token];
    //NSLog(@"THE URL :%@",urlString);
    NSURL *urlStrings = [NSURL URLWithString:urlString];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [jsonMsg length]];
    theRequest = [NSMutableURLRequest requestWithURL:urlStrings];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [jsonMsg dataUsingEncoding:NSUTF8StringEncoding]];	   
    
	return theRequest;
    
}


+(NSMutableURLRequest *)activityListRequest {
    NSString *access_token =  [[NSUserDefaults standardUserDefaults]
                               stringForKey:@"access_key"];
    
    NSString *urlString=activityList;
    urlString = [urlString stringByAppendingFormat:@"%@&format=json%@",access_token,@"&page_size=50"];
    //NSLog(@"The URl :%@",urlString);
    theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [theRequest setHTTPMethod:@"GET"];
	return theRequest;
}

+(NSMutableURLRequest *)getCommunityActivities:sender {
    NSString *access_token =  [[NSUserDefaults standardUserDefaults]
                               stringForKey:@"access_key"];
    
    NSString *urlString=activityList;
    urlString = [urlString stringByAppendingFormat:@"%@%@%@%@",access_token,@"&community_id=",sender,@"&page_size=50"];
    //NSLog(@"The URl :%@",urlString);
    theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [theRequest setHTTPMethod:@"GET"];
	return theRequest;
}


+(NSMutableURLRequest *)loginrequest:(NSString *) methodName{
    
    NSMutableDictionary *resultDic =[NSMutableDictionary dictionary];
    [resultDic setObject:methodName forKey:@"user"];
    [resultDic setObject:[[NSTimeZone localTimeZone] name] forKey:@"timezone"];
    JSONInterface *jsonInterface = [[JSONInterface alloc]init];
	NSString *jsonMsg = [jsonInterface encodeRequest:resultDic];
    [jsonInterface release];
    NSString *urlString=LoginURL;
    NSURL *urlStrings = [NSURL URLWithString:urlString];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [jsonMsg length]];
    theRequest = [NSMutableURLRequest requestWithURL:urlStrings];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [jsonMsg dataUsingEncoding:NSUTF8StringEncoding]];
    
	return theRequest;
}

+(NSMutableURLRequest *)confirmSignup:(NSString *) methodName{
    NSMutableDictionary *resultDic =[NSMutableDictionary dictionary];
    [resultDic setObject:methodName forKey:@"user"];
    JSONInterface *jsonInterface = [[JSONInterface alloc]init];
	NSString *jsonMsg = [jsonInterface encodeRequest:resultDic];
    [jsonInterface release];
    NSString *urlString=CONFIRMSIGNUP;
    NSURL *urlStrings = [NSURL URLWithString:urlString];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [jsonMsg length]];
    theRequest = [NSMutableURLRequest requestWithURL:urlStrings];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [jsonMsg dataUsingEncoding:NSUTF8StringEncoding]];
    
	return theRequest;
}

+(NSMutableURLRequest *)reciptRequest:(NSString *) methodName{
    NSMutableDictionary *resultDic =[NSMutableDictionary dictionary];
    [resultDic setObject:methodName forKey:@"receipt"];
    JSONInterface *jsonInterface = [[JSONInterface alloc]init];
	NSString *jsonMsg = [jsonInterface encodeRequest:resultDic];
    [jsonInterface release];
    NSString *urlString=[reciptURL stringByAppendingFormat:@"?access_token=%@",[[NSUserDefaults standardUserDefaults]                                                            stringForKey:@"access_key"]];
    NSURL *urlStrings = [NSURL URLWithString:urlString];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [jsonMsg length]];
    theRequest = [NSMutableURLRequest requestWithURL:urlStrings];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [jsonMsg dataUsingEncoding:NSUTF8StringEncoding]];
    
	return theRequest;
    
    
}

+(NSMutableURLRequest *)forgotpasswordrequest :(NSString *) forgotpassword_details{
    
    NSMutableDictionary *resultDic =[NSMutableDictionary dictionary];
    NSMutableDictionary *forgotpassworddic =[NSMutableDictionary dictionary];
    [forgotpassworddic setObject:forgotpassword_details forKey:@"email"];
    [resultDic setObject:forgotpassworddic forKey:@"user"];
    JSONInterface *jsonInterface = [[JSONInterface alloc]init];
	NSString *jsonMsg = [jsonInterface encodeRequest:resultDic];
    [jsonInterface release];
    NSString *urlString=ForgotURL;
    NSURL *urlStrings = [NSURL URLWithString:urlString];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [jsonMsg length]];
    theRequest = [NSMutableURLRequest requestWithURL:urlStrings];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [jsonMsg dataUsingEncoding:NSUTF8StringEncoding]];	   
    
	return theRequest;
}


+(NSMutableURLRequest *)registerrequest :(NSMutableArray *) methodName{
    
    NSMutableDictionary *resultDic =[NSMutableDictionary dictionary];
    NSMutableDictionary *registerDic =[NSMutableDictionary dictionary];
    [registerDic setObject:[methodName objectAtIndex:0] forKey:@"email"];
    [registerDic setObject:[methodName objectAtIndex:1] forKey:@"password"];
    [registerDic setObject:[methodName objectAtIndex:2] forKey:@"password_confirmation"];
    [registerDic setObject:[methodName objectAtIndex:3] forKey:@"first_name"];
    [registerDic setObject:[methodName objectAtIndex:4] forKey:@"last_name"];
    [resultDic setObject:registerDic forKey:@"user"];
    JSONInterface *jsonInterface = [[JSONInterface alloc]init];
	NSString *jsonMsg = [jsonInterface encodeRequest:resultDic];
    [jsonInterface release];
    NSString *urlString=RegisterURL;
    NSURL *urlStrings = [NSURL URLWithString:urlString];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [jsonMsg length]];
    theRequest = [NSMutableURLRequest requestWithURL:urlStrings];
    [theRequest addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [jsonMsg dataUsingEncoding:NSUTF8StringEncoding]];	   
    
	return theRequest;
}


@end
