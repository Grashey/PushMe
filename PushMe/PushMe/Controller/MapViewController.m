//
//  MapViewController.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 05.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _mapView = [[MKMapView alloc] initWithFrame: frame];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 100000, 100000);
    [_mapView setRegion: region animated: YES];
    [self.view addSubview:_mapView];
    _mapView.delegate = self;
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"Title";
    annotation.subtitle = @"Subtitle";
    annotation.coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    [_mapView addAnnotation:annotation];
  
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = @"MarkerIdentifier";
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(-5.0, 5.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    return annotationView;
}

- (void)addressFromLocation:(CLLocation *)location {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.name);
            }
        }
        
    }];
}

- (void)locationFromAddress:(NSString *)address {

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.location);
            }
        }
        
    }];
}

- (void)start {
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 500;
    
    [locationManager startUpdatingLocation];
}

@end
