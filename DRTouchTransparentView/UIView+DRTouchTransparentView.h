//
//  UIView+DRTouchTransparentView.h
//
//  Created by Dariusz Rybicki on 17.11.2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DRTouchTransparentView)

/**
 If YES, the view will behave like with user interaction disabled,
 unless any subview of the view can handle the touch.
 */
@property (nonatomic, readwrite) BOOL isTouchTransparent;

@end
