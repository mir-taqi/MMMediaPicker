//
//  MMMediaPicker.h
//  ImagePicker
//
//  Created by Mohammed Mir on 26/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^didFinishPicking)(NSArray *assets,id sender);


@interface MMMediaPicker : UINavigationController{
    
}

@property(nonatomic)NSUInteger maximumNumberOfSelects;
@property (nonatomic,copy)didFinishPicking pickingResult;
@property(nonatomic, assign)UIColor *tintColor;
@property(nonatomic, strong)NSString *navigationTitle;

@property(nonatomic, strong)NSString *doneNavigationButtonTitle;
@property(nonatomic, strong)NSString *cancelNavigationButtonTitle;

@end



NS_ASSUME_NONNULL_END
