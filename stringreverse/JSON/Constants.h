


@interface Constants : NSObject {

}

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define LoginURL @"https://api-meetlinkshare.heroku.com/v1/users/sign_in"
#define CONFIRMSIGNUP @"https://api-meetlinkshare.heroku.com/v1/users/resend_confirmation_mail"
#define reciptURL @"https://api-meetlinkshare.heroku.com/v1/subscribe_user"
#define ForgotURL @"https://api-meetlinkshare.heroku.com/v1/forgot_password"
#define RegisterURL @"https://api-meetlinkshare.heroku.com/v1/users"
#define activityList @"https://api-meetlinkshare.heroku.com/v1/activities?access_token="
#define contentTextValue @"Use the details tab to provide a brief description that appears on the note card.\n\nShare your notes with teams or distribution groups from the Details tab.\n\nCreate and invite users to join teams by exiting this note, selecting 'Virtual Teams' and clicking 'New Team'.  Users can be invited by e-mail address.\n\nFor any note that you share, you can collaborate with other users using comments.  When you select a shared note within a virtual team, you will see an addition icon on the toolbar that allows you add comments.\n\nComments can be added for each page of a shared note. "
//Urls for SYnchronisation to and from the cloud

/*********Pointing to Live Api Call***********
 
#define communitySynchronisation @"https://api-meetlinkshare.heroku.com/v1/community_synchronisation?access_token="
#define synchronisation @"https://api-meetlinkshare.heroku.com/v1/synchronisation?access_token="*/

/*********Pointing to Staging Api Call***********/

 #define communitySynchronisation @"https://api-meetlinkshare.heroku.com/v1/community_synchronisation?access_token="
 #define synchronisation @"https://api-meetlinkshare.heroku.com/v1/synchronisation?access_token="

@end
