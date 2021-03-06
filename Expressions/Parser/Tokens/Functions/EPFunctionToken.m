//
//  EPFunctionToken.m
//  Expressions
//
//  Created by Alex Nichol on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EPFunctionToken.h"

@implementation EPFunctionToken

@synthesize negative;

- (id)initWithString:(NSString *)aString {
	if ((self = [super init])) {
#if __has_feature(objc_arc)
        functionName = aString;
#else
		functionName = [aString retain];
#endif
	}
	return self;
}

- (NSString *)toString {
	return functionName;
}

- (NSString *)functionName {
	return functionName;
}

- (id)applyToOperand:(id)anOperand {
	return [self applyNegationToPositive:[self applyToOperandAbsolute:anOperand]];
}

- (EPNumericalToken *)applyToOperandAbsolute:(id)anOperand {
	@throw [NSException exceptionWithName:NSInternalInconsistencyException
								   reason:@"This is an abstract method and must be overridden."
								 userInfo:nil];
}

- (EPNumericalToken *)applyNegationToPositive:(EPNumericalToken *)theResult {
	if (negative) {
		return [theResult negativeToken];
	}
	return theResult;
}

- (id)negativeToken {
	EPFunctionToken * newToken = [self copy];
	[newToken setNegative:([self negative] ? NO : YES)];
#if __has_feature(objc_arc)
    return newToken;
#else
	return [newToken autorelease];
#endif
}

- (id)copyWithZone:(NSZone *)zone {
	return [[[self class] allocWithZone:zone] initWithString:[self toString]];
}

#if !__has_feature(objc_arc)
- (void)dealloc {
	[functionName release];
	[super dealloc];
}
#endif

@end
