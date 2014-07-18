//
//  ICViewController.m
//  ImagePlayerViewDemo
//
//  Created by 陈颜俊 on 14-6-6.
//  Copyright (c) 2014年 Chenyanjun. All rights reserved.
//

#import "ICViewController.h"

@interface ICViewController () <ImagePlayerViewDelegate>
@property (nonatomic, strong) NSArray *imageURLs;
@end

@implementation ICViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.imageURLs = @[[NSURL URLWithString:@"http://www.ghzw.cn/wzsq/UploadFiles_9194/201109/20110915154150869.bmp"],
                       [NSURL URLWithString:@"http://sudasuta.com/wp-content/uploads/2013/10/10143181686_375e063f2c_z.jpg"],
                       [NSURL URLWithString:@"http://www.yancheng.gov.cn/ztzl/zgycddhsdgy/xwdt/201109/W020110902584601289616.jpg"],
                       [NSURL URLWithString:@"http://fzone.oushinet.com/bbs/data/attachment/forum/201208/15/074140zsb6ko6hfhzrb40q.jpg"]];
    
    [self.imagePlayerView initWithCount:self.imageURLs.count delegate:self];
    self.imagePlayerView.scrollInterval = 5.0f;
    
    // adjust pageControl position
    self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomLeft;
    
    // hide pageControl or not
    self.imagePlayerView.hidePageControl = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ImagePlayerViewDelegate
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    // recommend to use SDWebImage lib to load web image
//    [imageView setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:nil];
    
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[self.imageURLs objectAtIndex:index]]];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"did tap index = %d", (int)index);
}
@end