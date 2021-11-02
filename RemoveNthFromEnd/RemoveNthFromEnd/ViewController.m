//
//  ViewController.m
//  RemoveNthFromEnd
//
//  Created by JXT on 2021/11/2.
//

#import "ViewController.h"

#import "XTList.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     19. 删除链表的倒数第 N 个结点
     给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

     进阶：你能尝试使用一趟扫描实现吗？

      
     示例 1：
     https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg

     输入：head = [1,2,3,4,5], n = 2
     输出：[1,2,3,5]
     示例 2：

     输入：head = [1], n = 1
     输出：[]
     示例 3：

     输入：head = [1,2], n = 1
     输出：[1]
      

     提示：

     链表中结点的数目为 sz
     1 <= sz <= 30
     0 <= Node.val <= 100
     1 <= n <= sz

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     双指针的经典应用，如果要删除倒数第n个节点，让fast移动n步，然后让fast和slow同时移动，直到fast指向链表末尾。删掉slow所指向的节点就可以了。
     
     设置慢指针指向头节点之前的新节点，当快指针先走n步后，和慢指针中间就隔了n个节点。
     同时开始移动，当快指针移动到最后一个节点之后的空节点时，慢指针后面有n个节点，
     于是倒数第n个节点就是慢指针后面的那个节点。

     作者：pisces34
     链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/solution/swift-kuai-man-zhi-zhen-by-pisces34-vpcg/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    XTList *list = [XTList new];
    for (int i = 0; i < 10; i ++) {
        [list append:@(i+1)];
    }
    [list printList:@"num"];
    
    XTNode *node = [self.class removeNthFromEnd:list.head :7];
    NSLog(@"%@", node);
}

+ (XTNode *)removeNthFromEnd:(XTNode *)head :(NSInteger)n
{
    XTNode *beforeHead = [XTNode new];
    beforeHead.data = head.data;
    beforeHead.next = head.next;
    
    XTNode *slow = beforeHead;
    XTNode *fast = head;
    
    // 指针先走n步后，和慢指针中间就隔了n个节点
    for (int i = 0; i < n; i ++) {
        fast = fast.next;
    }
    
    while (fast != nil) {
        fast = fast.next;
        slow = slow.next ? slow.next : beforeHead;
    }
    // 更新删除后的节点
    slow.next = slow.next.next;
    
    return beforeHead.next;
}

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
/**
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var beforeHead = ListNode(0, head)
        var slow = beforeHead
        var fast = head
        // 指针先走n步后，和慢指针中间就隔了n个节点
        for _ in 0..<n {
            fast = fast?.next
        }
        // 同时开始移动，当快指针移动到最后一个节点之后的空节点时，慢指针后面有n个节点
        // 倒数第n个节点就是慢指针后面的那个节点。
        while fast != nil {
            fast = fast?.next
            slow = slow.next ?? beforeHead
        }
        slow.next = slow.next?.next
        return beforeHead.next
    }
}*/

@end
