//
//  ViewController.m
//  ReverseWords
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
     557. 反转字符串中的单词 III
     
     给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

      

     示例：

     输入："Let's take LeetCode contest"
     输出："s'teL ekat edoCteeL tsetnoc"
      

     提示：

     在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/reverse-words-in-a-string-iii
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    NSString *s = @"Let's take LeetCode contest";
    [self.class reverseWords:s];
}

+ (NSString *)reverseWords:(NSString *)s
{
    NSMutableArray *sArray = [NSMutableArray array];
    // 倒序拆分单个字符字符串
    for (NSInteger i = s.length-1; i >= 0; i --) {
        unichar character = [s characterAtIndex:i];
        NSLog(@"%c", character);
        [sArray addObject:[NSString stringWithFormat:@"%c", character]];
    }
    // 组合完全倒序字符串
    NSString *reserseStr = [sArray componentsJoinedByString:@""];
    NSLog(@"%@", reserseStr);
    // 拆分单词数组，并倒序数组
    NSArray *reserseArr = [[[reserseStr componentsSeparatedByString:@" "] reverseObjectEnumerator] allObjects];
    NSLog(@"%@", reserseArr);
    // 空格拼接恢复字符串
    NSString *rlt = [reserseArr componentsJoinedByString:@" "];
    NSLog(@"%@", rlt);
    return rlt;
}


/**
 class Solution {
     func reverseWords(_ s: String) -> String {
         let reverse = String(s.reversed())
         let array = reverse.split(separator: " ")
         let res = array.reversed().joined(separator: " ")
         return res
     }
 }
 */

@end
