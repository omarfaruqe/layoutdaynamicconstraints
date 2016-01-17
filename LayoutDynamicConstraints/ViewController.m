//
//  ViewController.m
//  LayoutDynamicConstraints
//
//  Created by Omar Faruqe on 2016-01-15.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //setting webview content
    NSString *webURL = @"https:www.twitter.com";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    [self.webView loadRequest:request];
    
    //setting mapview content
    double latitude = 45.4937921;
    double longitude = -73.5861662;
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    pointAnnotation.title = @"Concordia University, Montreal";
    
    [self.mapView addAnnotation:pointAnnotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(pointAnnotation.coordinate, 2000, 2000);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
