//
//  ImagePickerViewController.m
//  ImagePicker
//
//  Created by Mohammed Mir on 25/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import "MMAlbumPickerViewController.h"

@interface MMAlbumPickerViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    MMAssetsManager *assetsManager;
}
@end

@implementation MMAlbumPickerViewController

- (instancetype)init {
    if ((self = [super init])) {
        assetsManager = [MMAssetsManager shared];
        [assetsManager.selectedAssets removeAllObjects];
    }
    return self;
}
- (void)performPicking:(void(^)(NSArray *assets))didFinishPicking{
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.title = @"";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
   
    
    // Do any additional setup after loading the view.
  //  self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    [self.tableView registerClass:[MMAlbumCell class] forCellReuseIdentifier:@"AlbumCell"];
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(UIImage *)getAssetThumbnail:(PHAsset * )asset {

  PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
  options.synchronous = true;

  __block UIImage *image;
  [PHCachingImageManager.defaultManager requestImageForAsset:asset targetSize:CGSizeMake(200, 200) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
      image = result;
  }];
  return image;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MMAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    PHAsset *asset = assetsManager.assets[indexPath.row];
    UIImage *image = [self getAssetThumbnail:asset];
    cell.middleImageView.image = image;
    cell.titleLabel.text = @"All photos";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MMAssetsViewController *avc = [[MMAssetsViewController alloc]init];
    avc.maximumNumberOfSelections = _maximumNumberOfSelections;
    [self.navigationController pushViewController:avc animated:YES];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}



@end
