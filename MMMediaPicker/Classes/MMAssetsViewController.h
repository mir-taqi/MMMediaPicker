//
//  MMAssetsViewController.h
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMAssetsCollectionViewCell.h"
#import "MMAssetsManager.h"
#import "MMMediaPicker.h"


NS_ASSUME_NONNULL_BEGIN

@interface MMAssetsViewController : UICollectionViewController



@property(nonatomic)NSUInteger maximumNumberOfSelections;
@end

NS_ASSUME_NONNULL_END
