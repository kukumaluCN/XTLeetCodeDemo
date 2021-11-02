//
//  ViewController.m
//  MiddleNode
//
//  Created by JXT on 2021/11/1.
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
     876. 链表的中间结点
     
     给定一个头结点为 head 的非空单链表，返回链表的中间结点。

     如果有两个中间结点，则返回第二个中间结点。

      

     示例 1：

     输入：[1,2,3,4,5]
     输出：此列表中的结点 3 (序列化形式：[3,4,5])
     返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
     注意，我们返回了一个 ListNode 类型的对象 ans，这样：
     ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
     示例 2：

     输入：[1,2,3,4,5,6]
     输出：此列表中的结点 4 (序列化形式：[4,5,6])
     由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
      

     提示：

     给定链表的结点数介于 1 和 100 之间。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/middle-of-the-linked-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
            
     */
    
    /**
     快慢指针法
     思路和算法

     我们可以继续优化方法二，用两个指针 slow 与 fast 一起遍历链表。slow 一次走一步，fast 一次走两步。那么当 fast 到达链表的末尾时，slow 必然位于中间。
     
     复杂度分析

     时间复杂度：O(N)，其中 NN是给定链表的结点数目。
     空间复杂度：O(1)，只需要常数空间存放 slow 和 fast 两个指针。

     作者：LeetCode-Solution
     链接：https://leetcode-cn.com/problems/middle-of-the-linked-list/solution/lian-biao-de-zhong-jian-jie-dian-by-leetcode-solut/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    XTList *list = [XTList new];
    for (int i = 0; i < 5; i ++) {
        [list append:@(i+1)];
    }
    [list printList:@"num"];
    
    
    XTNode *middle = [self.class middleNode:list.head];
    NSLog(@"middle:%@", middle);
}

+ (XTNode *)middleNode:(XTNode *)head
{
    XTNode *slow = head;
    XTNode *fast = head;
    while (fast.next != nil) {
        slow = slow.next;
        fast = fast.next.next;
    }
    return slow;
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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
*/

@end
