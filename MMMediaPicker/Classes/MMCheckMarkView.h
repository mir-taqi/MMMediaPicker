//
//  MMCheckMarkView.h
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMCheckMarkView : UIView
@property (nonatomic) UIColor *borderColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat borderWidth UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *checkmarkColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat checkmarkLineWidth UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *fillColor UI_APPEARANCE_SELECTOR;
@end

NS_ASSUME_NONNULL_END
