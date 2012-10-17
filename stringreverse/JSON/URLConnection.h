
@interface URLConnection : NSURLConnection {
    /**
     Assign Delegate object 
     */
	id delgateObject;
    /**
     
     */
    NSMutableData *urlData;
    NSString *setIdentifier;
}

@property(nonatomic,retain)id delgateObject;
@property(nonatomic,retain)NSMutableData *urlData;
@property(nonatomic,retain)NSString *setIdentifier;

/**
 @param requestArg - Create Mutable Request
 @param delegateArg - Delegate
 @param checkIdentity - parameter for identification
 */

- (id) initWithMethodNameRequest:(NSMutableURLRequest *)requestArg 
                        delegate:(id)delegateArg 
                      identifier:(NSString *)checkIdentity;

- (id) initWithMethodRequest:(NSMutableURLRequest *)requestArg 
                    delegate:(id)delegateArg;

@end
