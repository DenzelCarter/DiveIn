//
//  ListPhotosViewController.h
//  DiveIn
//
//  Created by Denzel Carter on 4/1/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DropboxSDK/DropboxSDK.h>

@interface ListPhotosViewController : UITableViewController <DBRestClientDelegate>{
    DBRestClient *restClient;
    NSMutableArray *dropboxURLs;
}
@end
