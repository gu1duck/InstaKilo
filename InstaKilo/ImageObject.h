//
//  ImageObject.h
//  InstaKilo
//
//  Created by Jeremy Petter on 2015-05-21.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageObject : NSObject
@property (nonatomic) NSString* location;
@property (nonatomic) NSString* subject;
@property (nonatomic) UIImage* image;

+(instancetype)imageObjectWithImage: (UIImage*)image subject: (NSString*)subject andLocation:(NSString*)location;

+(NSArray*) filterImageObjects:(NSArray*)imageObjects byLocationOrSubject:(NSString*)filter;
+(NSArray*) getUniqueLocations:(NSArray*)imageObjects;
+(NSArray*) getUniqueSubjects:(NSArray*)imageObjects;

+(NSArray*)sortImageObjectsByLocation:(NSArray*)imageObjects;
+(NSArray*)sortImageObjectsBySubject:(NSArray*)imageObjects;

@end
