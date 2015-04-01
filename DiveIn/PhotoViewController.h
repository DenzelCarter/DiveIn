//
//  PhotoViewController.h
//  DiveIn
//
//  Created by Denzel Carter on 3/31/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    IBOutlet UIImageView *ImageView;
    UIImagePickerController  *picker;
    UIImage *image;
}

- (IBAction)takePhoto:(id)sender;

- (IBAction)uploadD_click:(id)sender;

- (IBAction)unlink_click:(id)sender;


@end
