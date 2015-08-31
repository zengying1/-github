//
//  ViewController.m
//  Text
//
//  Created by 1808 on 15/8/31.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"4.png"], nil];

     _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,600)];
    [_scrollView setPagingEnabled:YES];
         _scrollView.showsVerticalScrollIndicator = YES;
         [_scrollView setDelegate:self];
        [_scrollView setBackgroundColor:[UIColor lightGrayColor]];
         //ContentSize 这个属性对于UIScrollView挺关键的，取决于是否滚动。
        [_scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame) * [self.arrayImages count], self.view.frame.size.height+70)];
        [self.view addSubview:_scrollView];

      _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(-20, self.scrollView.frame.size.height, self.view.frame.size.height, 20)];
    [_pageControl setBackgroundColor:[UIColor grayColor]];
           _pageControl.currentPage = 0;
        _pageControl.numberOfPages = [self.arrayImages count];
        [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    _viewController = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < [self.arrayImages count]; i++) {
                [_viewController addObject:[NSNull null]];
        }
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollPages) userInfo:nil repeats:YES];
    [self loadScrollViewPage:0];
    [self loadScrollViewPage:1];
    [self loadScrollViewPage:2];
    [self loadScrollViewPage:3];
}

-(void)loadScrollViewPage:(NSInteger)page
 {
         if (page >= self.arrayImages.count) {
                return;
           }
    
         UIViewController *imageViewController = [self.viewController objectAtIndex:page];
         if ((NSNull *)imageViewController == [NSNull null])
             {
                    imageViewController = [[UIViewController alloc] init];
                    [self.viewController replaceObjectAtIndex:page withObject:imageViewController];
             }
    
        if (imageViewController.view.superview == nil) {
                CGRect frame = self.scrollView.frame;
               frame.origin.x = CGRectGetWidth(frame) * page;
                frame.origin.y = 0;
                imageViewController.view.frame = frame;
               [self.scrollView addSubview:imageViewController.view];
                [imageViewController didMoveToParentViewController:self];
                 [imageViewController.view setBackgroundColor:[UIColor colorWithPatternImage:(UIImage *)[self.arrayImages objectAtIndex:page]]];
       }
    }
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
         CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
         NSInteger page = floor((self.scrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
         self.pageControl.currentPage = page;
         [self loadScrollViewPage:page-1];
         [self loadScrollViewPage:page];
        [self loadScrollViewPage:page+1];
     }
- (IBAction)changePage:(id)sender
 {
         NSInteger page = self.pageControl.currentPage;
    
         [self loadScrollViewPage:page - 1];
        [self loadScrollViewPage:page];
        [self loadScrollViewPage:page + 1];
         CGRect bounds = self.scrollView.bounds;
         bounds.origin.x = CGRectGetWidth(bounds) * page;
         bounds.origin.y = 0;
         [self.scrollView scrollRectToVisible:bounds animated:YES];
     }
-(void)scrollPages{
         ++self.pageControl.currentPage;
         CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
        if (isFromStart) {
                [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
               self.pageControl.currentPage = 0;
            }
          else
            {
                   [self.scrollView setContentOffset:CGPointMake(pageWidth*self.pageControl.currentPage, self.scrollView.bounds.origin.y)];
   
               }
     if (_pageControl.currentPage == _pageControl.numberOfPages - 1) {
                isFromStart = YES;
          }
        else
           {
                  isFromStart = NO;
                }
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
