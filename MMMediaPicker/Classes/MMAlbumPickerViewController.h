//
//  ImagePickerViewController.h
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMAssetsManager.h"
#import "MMAlbumCell.h"
#import "MMAssetsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMAlbumPickerViewController : UITableViewController
@property(nonatomic)NSInteger maximumNumberOfSelections;

- (void)performPicking:(void(^)(NSArray *assets))didFinishPicking;
@end

NS_ASSUME_NONNULL_END
