//
//  MMCameraViewController.m
//  ImagePicker
//
//  Created by Mohammed Mir on 26/12/2020.
//  Copyright © 2020 Sejel Technology. All rights reserved.
//

#import "MMCameraViewController.h"

@interface MMCameraViewController ()

@end

@implementation MMCameraViewController

-(void)viewWillAppear:(BOOL)animated{
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Top toolbar
 
    picker = [[UIImagePickerController alloc]init];
   
         picker.delegate = self;
         picker.allowsEditing = YES;
    
         picker.sourceType = UIImagePickerControllerSourceTypeCamera;
           [picker showsCameraControls];
      [self presentViewController:picker animated:YES completion:^{
          
        
      }];
 
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
     UIImage *chosenImage = info[UIImagePickerControllerEditedImage];

       
    [_delegate cameraDidFinishPicking:chosenImage camera:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
