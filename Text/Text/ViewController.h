//
//  ViewController.h
//  Text
//
//  Created by 1808 on 15/8/31.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    BOOL isFromStart;
    
}
@property(nonatomic, strong)UIScrollView  *scrollView;      //声明一个UIScrollView
@property(nonatomic, strong)UIPageControl *pageControl;     //声明一个UIPageControl
@property(nonatomic, strong)NSArray  *arrayImages;          //存放图片的数组
@property(nonatomic, strong)NSMutableArray *viewController;

-(void)loadScrollViewPage:(NSInteger)page;
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
- (IBAction)changePage:(id)sender;
-(void)scrollPages;

@end

