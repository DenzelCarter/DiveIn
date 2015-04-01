//
//  PhotoViewController.m
//  DiveIn
//
//  Created by Denzel Carter on 3/31/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

#import "PhotoViewController.h"
#import <DropboxSDK/DropboxSDK.h>

@interface PhotoViewController () <DBRestClientDelegate>
@property (nonatomic, strong) DBRestClient *restClient;
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    self.restClient.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender {
    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)uploadD_click:(id)sender {
    int Rand = [self generateRandomNumberBetweenMin:1 Max:1000]; // generate a number between 1 and 1000
    NSString *filename = [NSString stringWithFormat:@"%i.png", Rand];// places random number before .png in order to upload multiple files
    NSData * data = [NSData dataWithData:UIImageJPEGRepresentation(ImageView.image,1)];
    NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"%i.png"];
    [data writeToFile:file atomically:YES];
    [self.restClient uploadFile:filename  toPath:@"Dropbox/Path" fromPath:file];
    NSLog(@"random number : %i",Rand);
}

- (IBAction)unlink_click:(id)sender {
    [[DBSession sharedSession] unlinkAll]; //will unlink to dropbox
    [self.navigationController popToRootViewControllerAnimated:YES];//will return back to the view controller
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [ImageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)uploadFile:(NSString *)filename toPath:(NSString *)path withParentRev:(NSString *)parentRev fromPath:(NSString *)sourcePath{
    NSLog(@"%i.png");
}

- (void)restClient:(DBRestClient*)client uploadProgress:(CGFloat)progress forFile:(NSString *)destPath from:(NSString *)srcPath
{
    NSLog(@"%.2f",progress); //Correct way to show progress in uploading photo in the logs
    
}

-(int)generateRandomNumberBetweenMin:(int)min Max:(int)max
{
    return ( (arc4random() % (max-min+1)) + min ); //function for random number
}


@end
