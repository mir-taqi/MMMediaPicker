//
//  MMCameraViewController.h
//  ImagePicker
//
//  Created by Mohammed Mir on 26/12/2020.
//  Copyright © 2020 Sejel Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMAssetsManager.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MMCameraViewControllerDelegate;
@interface MMCameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController *picker;
}
@property(nonatomic, strong)id<MMCameraViewControllerDelegate>delegate;
@end


@protocol MMCameraViewControllerDelegate <NSObject>

-(void)cancelTakingCameraPicture:(MMCameraViewController *)picker;
-(void)cameraDidFinishPicking:(UIImage *)picture camera:(MMCameraViewController *)controller;

@end
NS_ASSUME_NONNULL_END
