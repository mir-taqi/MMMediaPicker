//
//  MMAssetsViewController.m
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import "MMAssetsViewController.h"

@interface MMAssetsViewController ()
{
}
@end

@implementation MMAssetsViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    if ((self = [super initWithCollectionViewLayout:layout])) {
      UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
             NSInteger itemsInARow = ceilf(self.collectionView.frame.size.width/150.0f);
             CGFloat padding  = 5;
             CGFloat totalPadding = padding * itemsInARow ;
             CGFloat individualPadding = totalPadding/itemsInARow;
             CGFloat width = self.collectionView.frame.size.width / itemsInARow - individualPadding;
             CGFloat height = width;
             layout.itemSize = CGSizeMake(width, height);
             layout.minimumInteritemSpacing = padding;
             layout.minimumLineSpacing = padding;
    }
    
    return self;
}
-(void)cancelPicking:(id)sender{
    
}
-(void)donePicking:(id)sender{
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    MMMediaPicker *navigationController = (MMMediaPicker *)self.navigationController;
      if(navigationController.cancelNavigationButtonTitle != nil)
      self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:navigationController.cancelNavigationButtonTitle style:UIBarButtonItemStylePlain target:navigationController action:@selector(cancelPicking:)];
      self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:navigationController.doneNavigationButtonTitle != nil? navigationController.doneNavigationButtonTitle:@"Done" style:UIBarButtonItemStylePlain target:navigationController action:@selector(donePicking:)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
     //self.navigationItem.hidesBackButton = YES;
    // Register cell classes
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.allowsMultipleSelection = YES;

   [self.collectionView registerClass:[MMAssetsCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
       [self.collectionView reloadData];

    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return MMAssetsManager.shared.assets.count;
}
-(void )setImageFrom:(PHAsset * )asset cell: (MMAssetsCollectionViewCell *)cell{

  PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
  options.synchronous = true;
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
    [PHCachingImageManager.defaultManager requestImageForAsset:asset targetSize:CGSizeMake(200, 200) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
      
         dispatch_async(dispatch_get_main_queue(), ^(void) {
            // cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
             cell.imageView.image =  result;
           });
    }];
      
  });
 
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    
    MMAssetsCollectionViewCell *assetCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
       
    PHAsset *asset = MMAssetsManager.shared.assets[indexPath.row];
    [self setImageFrom:asset cell:assetCell];
    
     if([MMAssetsManager.shared.selectedAssets containsObject:asset]){
          [assetCell.contentView bringSubviewToFront:assetCell.checkmarkView];
     }
     else{
           [assetCell.contentView sendSubviewToBack:assetCell.checkmarkView];
     }
    
    // Configure the cell
    
    return assetCell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MMAssetsCollectionViewCell *assetCell = (MMAssetsCollectionViewCell*) [collectionView cellForItemAtIndexPath:indexPath];
      PHAsset *asset = MMAssetsManager.shared.assets[indexPath.row];
     
       if(MMAssetsManager.shared.selectedAssets.count <_maximumNumberOfSelections){
          
             [MMAssetsManager.shared.selectedAssets addObject:asset];
             [assetCell.contentView bringSubviewToFront:assetCell.checkmarkView];
           }
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    MMAssetsCollectionViewCell *assetCell = (MMAssetsCollectionViewCell*) [collectionView cellForItemAtIndexPath:indexPath];
    PHAsset *asset = MMAssetsManager.shared.assets[indexPath.row];
      if([MMAssetsManager.shared.selectedAssets containsObject:asset]){
                   [MMAssetsManager.shared.selectedAssets removeObject:asset];
                   [assetCell.contentView sendSubviewToBack:assetCell.checkmarkView];
            }
}

#pragma mark <UICollectionViewDelegate>
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//
//    return CGSizeMake(100, 100);
//}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    
}
*/

@end

