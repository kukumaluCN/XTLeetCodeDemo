//
//  XTNode.h
//  MiddleNode
//
//  Created by JXT on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 一个单链表节点包含存储数据和下一个节点的地址
@interface XTNode : NSObject

@property (atomic, strong, nullable) id data; // 节点数据
@property (atomic, strong, nullable) XTNode * next; //下一个节点

@end

NS_ASSUME_NONNULL_END
