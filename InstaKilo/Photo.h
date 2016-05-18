//
//  Photo.h
//  InstaKilo
//
//  Created by Rosalyn Kingsmill on 2016-05-18.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property NSString* location;
@property NSString* subject;
@property UIImage* image;

-(instancetype)initWithImage:(UIImage*)image location:(NSString*)location subject:(NSString*)subject;

@end
