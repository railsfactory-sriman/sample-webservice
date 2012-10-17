

#import "Utils.h"

@implementation Utils
#define APP_NAME @"DropThought"
#define ACTIVITY_TAG 100
UIAlertView *alertview;

+(void)showAlertMessage:(NSString *)message
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:APP_NAME message:message
												   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];	
    
}
+(void)showAlertMessageOption:(NSString *)message
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:APP_NAME message:message
												   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done",nil];
    [alert show];
    [alert release];	
    
}

+(void)showProgress
{
	alertview = [[UIAlertView alloc] initWithTitle:@"Loading..." message:nil
                                      delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    
	UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[indicator setFrame:CGRectMake(120.0, 50.0, 30.0, 30.0)];
	indicator.tag=ACTIVITY_TAG;
	[alertview addSubview:indicator];
	[indicator startAnimating];
	[alertview show];
    [indicator release];
}

+ (void) hideAlert
{
	if(alertview!=nil&& [alertview isKindOfClass:[UIAlertView class]] ){
		if([alertview viewWithTag:ACTIVITY_TAG]){
			UIActivityIndicatorView *indicator=(UIActivityIndicatorView *)[alertview viewWithTag:500];
			[indicator stopAnimating];
		}
		[alertview dismissWithClickedButtonIndex:0 animated:YES];
		[alertview release];	
		alertview=nil;
	}
}

@end
