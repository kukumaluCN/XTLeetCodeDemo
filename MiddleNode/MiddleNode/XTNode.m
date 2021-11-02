//
//  XTNode.m
//  MiddleNode
//
//  Created by JXT on 2021/11/1.
//

#import "XTNode.h"

@implementation XTNode

- (NSString *)description
{
    return [NSString stringWithFormat:@"current:%@ -> next:%@", _data, _next.data];
}

@end
