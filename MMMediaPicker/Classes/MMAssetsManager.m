//
//  MMAssetsManager.m
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import "MMAssetsManager.h"

static MMAssetsManager *shared = nil;
static NSBundle *bundle = nil;

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
-(void)checkAuthorizationStatus{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
        if(status == PHAuthorizationStatusAuthorized){
            [self->_assets removeAllObjects];
            [self->_assets addObjectsFromArray:[self getAllPhotos]];
            [self setValue:[NSNumber numberWithBool:YES] forKey:@"isAccessGranted"];
             self->_isAccessGranted = YES;
            
        }
        else{
            self->_isAccessGranted = NO;
        }
    }];
    
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
         _assets = [NSMutableArray array];
        [self checkAuthorizationStatus];

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


- (void) setLanguage:(NSString*) l{
    
    NSString *path = [[ NSBundle mainBundle ] pathForResource:l ofType:@"lproj" ];
    
    if (path == nil)
        //in case the language does not exists
        [self resetLocalization];
    else
        bundle = [NSBundle bundleWithPath:path];
}
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
    return [bundle localizedStringForKey:key value:comment table:nil];
}
- (void) resetLocalization
{
    bundle = [NSBundle mainBundle];
}

@end
