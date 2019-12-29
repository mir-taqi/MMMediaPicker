//
//  MMAssetsManager.h
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMAssetsManager : NSObject

@property (nonatomic, strong)NSMutableArray *assets;
@property (nonatomic, strong)NSMutableArray *selectedAssets;
+(nonnull MMAssetsManager*)shared;
@end

NS_ASSUME_NONNULL_END
