//
//  MMAssetsCollectionViewCell.h
//  ImagePicker
//
//  Created by Mohammed Mir on 29/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCheckMarkView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMAssetsCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *checkmarkView;
@end

NS_ASSUME_NONNULL_END
