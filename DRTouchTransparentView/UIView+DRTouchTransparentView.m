//
//  UIView+DRTouchTransparentView.m
//
//  Created by Dariusz Rybicki on 17.11.2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "UIView+DRTouchTransparentView.h"
#import <objc/runtime.h>

@implementation UIView (DRTouchTransparentView)

#pragma mark - Category initialization

+ (void)load
{
	void(^swizzle)(Class class, SEL original, SEL new) = ^(Class class, SEL original, SEL new) {
		Method originalMethod = class_getInstanceMethod(class, original);
		Method newMethod = class_getInstanceMethod(class, new);
		if(class_addMethod(class, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
			class_replaceMethod(class, new, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
		} else {
			method_exchangeImplementations(originalMethod, newMethod);
		}
	};
	
	swizzle([self class], @selector(hitTest:withEvent:), @selector(DRTouchTransparentView_hitTest:withEvent:));
}

#pragma mark - Property setter and getter

- (void)setIsTouchTransparent:(BOOL)touchTransparent
{
	NSNumber *value = [NSNumber numberWithBool:touchTransparent];
	objc_setAssociatedObject(self, @selector(isTouchTransparent), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isTouchTransparent
{
	id value = objc_getAssociatedObject(self, @selector(isTouchTransparent));
	if ([value isKindOfClass:[NSNumber class]])
	{
		return [value boolValue];
	}
	return NO;
}

#pragma mark - Hit test

- (UIView *)DRTouchTransparentView_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
	// check if view is 'touch transparent'
	if (self.isTouchTransparent)
	{
		// check if any subview of the view cal handle the touch
		for (UIView *subview in self.subviews)
		{
			UIView *view = [subview hitTest:[subview convertPoint:point fromView:self] withEvent:event];
			if (view)
			{
				// if so, return subview that handles the touch
				return view;
			}
		}
		
		// if no, return nil like when the view has user interaction disabled
		return nil;
	}
	
	// call default implementation
	return [self DRTouchTransparentView_hitTest:point withEvent:event];
}

@end
