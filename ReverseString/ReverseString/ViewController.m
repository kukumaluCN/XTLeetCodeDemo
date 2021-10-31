//
//  ViewController.m
//  ReverseString
//
//  Created by JXT on 2021/10/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     344. 反转字符串
     编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 s 的形式给出。

     不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

      

     示例 1：

     输入：s = ["h","e","l","l","o"]
     输出：["o","l","l","e","h"]
     示例 2：

     输入：s = ["H","a","n","n","a","h"]
     输出：["h","a","n","n","a","H"]
      

     提示：

     1 <= s.length <= 105
     s[i] 都是 ASCII 码表中的可打印字符

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/reverse-string
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    NSMutableArray *s = @[@"h",@"e",@"l",@"l",@"o",@"-"].mutableCopy;
    NSLog(@"%@", s);
    [self.class reverseString:&s];
    NSLog(@"%@", s);
}

+ (void)reverseString:(NSMutableArray <NSString *>**)s
{
    NSMutableArray <NSString *>*arr = *s;
    for (int i = 0; i < arr.count/2; i ++) {
        [arr exchangeObjectAtIndex:i withObjectAtIndex:arr.count-i-1];
    }
}

/**
 // 效率极高的方法。。。
 class Solution {
     func reverseString(_ s: inout [Character]) {
         s.reverse()
     }
 }
 
 // 替换
 class Solution {
     func reverseString(_ s: inout [Character]) {
         for index in 0..<s.count/2 {
             s.swapAt(index, s.count-index-1)
         }
     }
 }
 */


@end
