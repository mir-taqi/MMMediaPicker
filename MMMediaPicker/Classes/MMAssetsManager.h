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

typedef NS_ENUM(NSUInteger, MMMediaType) {
    
    MMMediaTypeGallery,
   
    MMMediaTypeCamera,
};


NS_ASSUME_NONNULL_BEGIN

#define MMLocalizedString(key,comment) \
[[MMAssetsManager shared] localizedStringForKey:(key) value:(comment)]

@interface MMAssetsManager : NSObject

@property (nonatomic, strong)NSMutableArray *assets;
@property (nonatomic, strong)NSMutableArray *selectedAssets;
@property (nonatomic)BOOL isAccessGranted;
+(nonnull MMAssetsManager*)shared;

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;
- (void) setLanguage:(NSString*) language;
@end

NS_ASSUME_NONNULL_END
