//
//  MMAssetsManager.m
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import "MMAssetsManager.h"

static MMAssetsManager *shared = nil;
@implementation MMAssetsManager


+(MMAssetsManager*)shared
{
    @synchronized([MMAssetsManager class])
    {
        if (!shared)
            shared = [[self alloc] init];
        
    }
    
    return shared;
}

+(id)alloc
{
    @synchronized([MMAssetsManager class])
    {
        NSAssert(shared== nil, @"Attempted to allocate a second instance of a singleton.");
        shared = [super alloc];
        return shared;
    }
}

-(id)init {
    self = [super init];
    if (self != nil) {
        _assets = [NSMutableArray arrayWithArray:[self getAllPhotos]];
        _selectedAssets = [NSMutableArray array];
    }
    return self;
}
-(NSArray *)getAllPhotos{
    NSMutableArray *photos = [NSMutableArray array];
    PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
       fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:false]];
    
   PHFetchResult *results = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions];
    

   [results enumerateObjectsUsingBlock:^(PHAsset *obj, NSUInteger idx, BOOL * _Nonnull stop) {
       [photos addObject:obj];
   }];

    return photos;
}

@end
