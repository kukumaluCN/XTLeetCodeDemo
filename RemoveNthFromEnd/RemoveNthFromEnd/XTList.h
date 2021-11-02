//
//  XTList.h
//  MiddleNode
//
//  Created by JXT on 2021/11/1.
//

#import <Foundation/Foundation.h>

#import "XTNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface XTList : NSObject

@property (atomic, strong, readonly) XTNode * head;
@property (atomic, strong, readonly) XTNode * tail;
@property (atomic, assign, readonly) NSInteger size;


- (instancetype)init;

- (void)append:(id)data;

- (void)printList:(NSString *)preInfo;

@end

NS_ASSUME_NONNULL_END
