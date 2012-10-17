//
//  ViewController.m
//  stringreverse
//
//  Created by Sri Family on 17/10/12.
//  Copyright (c) 2012 Sri Family. All rights reserved.
//

#import "ViewController.h"
#import "JSON/JSON.h"
#import "URLConnection.h"
#import "Utils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *value=@"sriman";
    NSLog(@"sriman %d",[value length]);
    NSMutableURLRequest *theRequest = nil;


    
    NSString *urlString=@"https://api-meetlinkshare.heroku.com/v1/industries";

    //NSLog(@"The URl :%@",urlString);
    theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [Utils showProgress];
    [theRequest setHTTPMethod:@"GET"];
    NSLog(@"the rquest %@",theRequest);

        URLConnection *connection=[[URLConnection alloc] initWithMethodRequest:theRequest delegate:self];
    //[connection release];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
-(void)receivedData:(NSMutableData *)data{
    NSString *ResponseString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    NSLog(@"response string %@",ResponseString);
    [Utils hideAlert];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
