//
//  EPMulDivOperator.h
//  Expressions
//
//  Created by Alex Nichol on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EPOperator.h"

@interface EPMulDivOperator : EPOperator {
	BOOL isDivision;
}

- (BOOL)isDivision;

@end
