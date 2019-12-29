//
//  MMAssetsCollectionViewCell.m
//  ImagePicker
//
//  Created by Mohammed Mir on 29/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import "MMAssetsCollectionViewCell.h"

@implementation MMAssetsCollectionViewCell
@synthesize imageView = _imageView;
@synthesize checkmarkView = _checkmarkView;


- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imageView;
}


- (UIView *)checkmarkView {
    if (!_checkmarkView) {
        _checkmarkView = [[MMCheckMarkView alloc] init];
        _checkmarkView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _checkmarkView;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];

    //self.checkmarkView.hidden = !selected;
   
    
   // self.overlayView.hidden = !(self.showsOverlayViewWhenSelected && selected);
}


- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
         [self.contentView addSubview:self.checkmarkView];
        [self.contentView addSubview:self.imageView];
       
        [self setupViewConstraints];
        
    }
    return self;
}


#pragma mark - Private

- (void)setupViewConstraints {
    NSDictionary *views = @{
        @"imageView": self.imageView,
        @"checkmarkView": self.checkmarkView
    };
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:kNilOptions metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:kNilOptions metrics:nil views:views]];


    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[checkmarkView(24.0)]-4.0-|" options:kNilOptions metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4.0-[checkmarkView(24.0)]" options:kNilOptions metrics:nil views:views]];
}

@end
