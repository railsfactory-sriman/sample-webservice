
@interface RestCall : NSObject {
    
   
}

+(NSMutableURLRequest *)loginrequest :(NSString *) methodName;
+(NSMutableURLRequest *)registerrequest :(NSMutableArray *) methodName;
+(NSMutableURLRequest *)confirmSignup:(NSString *) methodName;
+(NSMutableURLRequest *)forgotpasswordrequest :(NSString *) forgotpassword_details;
+(NSMutableURLRequest *)syncRequest :(NSMutableArray *) methodName;
+(NSMutableURLRequest *)activityListRequest;
+(NSMutableURLRequest *)communitySync:(NSMutableArray *)communityDetails;
+(NSMutableURLRequest *)getCommunityActivities:sender;
+(NSMutableURLRequest *)reciptRequest:(NSString *) methodName;
@end