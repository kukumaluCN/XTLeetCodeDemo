//
//  XTList.m
//  MiddleNode
//
//  Created by JXT on 2021/11/1.
//

#import "XTList.h"

@interface XTList ()
@property (atomic, strong, readwrite) XTNode * head;
@property (atomic, strong, readwrite) XTNode * tail;
@property (atomic, assign, readwrite) NSInteger size;
@property (atomic, strong) NSLock *mutex;
@end

@implementation XTList

+ (instancetype)new
{
    return [[XTList alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 创建首节点
        _head = nil;
        // 新初始化的链表，尾节点就是首节点
        _tail = _head;
        // 初始化
        _size = 0;
        // 互斥锁
        _mutex = [[NSLock alloc] init];
    }
    return self;
}

- (void)append:(id)data
{
    [self.mutex lock];
    
    XTNode *node = [XTNode new];
    node.data = data;
    node.next = nil;
    
    // 空链表，就是初始
    if (self.head == nil) {
        self.head = node;
//        NSLog(@"head:%@", self.head);
    }
    // 非空，拼接tail.next
    // 之前的尾节点的next节点是现在新的节点
    else {
        self.tail.next = node;
//        NSLog(@"1self.tail:%@", self.tail);
//        NSLog(@"self.tail.next:%@", self.tail.next);
    }
    
    // 将新节点设置成最新的尾节点
    self.tail = node;
//    NSLog(@"2self.tail:%@", self.tail);
    
    // 尺寸
    self.size ++;
    
    [self.mutex unlock];
}

- (XTNode *)popNode
{
    [self.mutex lock];
    id res = nil;
    
    if (self.head != nil) {
        res = self.head;
        
        XTNode *temp = self.head;
        self.head = temp.next;
        
        if (self.head == nil) {
            self.tail = nil;
        }
        
        temp.next = nil;
        self.size --;
    }
    [self.mutex unlock];
    return res;
}

- (void)printList:(NSString *)preInfo
{
    XTNode *current = self.head;
    while (current) {
        NSLog(@"%@ - %@", preInfo, current);
        current = current.next;
    }
}

@end
