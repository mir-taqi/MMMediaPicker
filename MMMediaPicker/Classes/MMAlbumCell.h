//
//  AlbumCell.h
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMAlbumCell : UITableViewCell{
    
}
@property (nonatomic, readonly) UIImageView *frontImageView;
@property (nonatomic, readonly) UIImageView *middleImageView;
@property (nonatomic, readonly) UIImageView *backImageView;
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic) UIView *imageContainerView;

@end

NS_ASSUME_NONNULL_END
