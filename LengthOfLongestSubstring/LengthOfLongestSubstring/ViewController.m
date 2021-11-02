//
//  ViewController.m
//  LengthOfLongestSubstring
//
//  Created by JXT on 2021/11/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     3. 无重复字符的最长子串
     
     给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

      
     示例 1:

     输入: s = "abcabcbb"
     输出: 3
     解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
     示例 2:

     输入: s = "bbbbb"
     输出: 1
     解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
     示例 3:

     输入: s = "pwwkew"
     输出: 3
     解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
          请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
     示例 4:

     输入: s = ""
     输出: 0
      

     提示：

     0 <= s.length <= 5 * 104
     s 由英文字母、数字、符号和空格组成

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    NSString *s = @"pwwkew"; //@"abcabcbb" @"bbbbb" @"pwwkew" @"dvdf";
    NSLog(@"rlt - %zd", [self.class lengthOfLongestSubstring:s]);
}

+ (NSInteger)lengthOfLongestSubstring:(NSString *)s
{
    NSMutableString *maxLengthStr = [NSMutableString string];
    NSMutableString *currentStr = [NSMutableString string];
    for (NSInteger i = 0; i < s.length; i ++) {
        NSString *charStr = [NSString stringWithFormat:@"%c", [s characterAtIndex:i]];
        NSLog(@"i:%zd charStr:%@", i, charStr);
        while ([currentStr containsString:charStr]) {
            // 每次删除一个字符，直到删到重复的，剩下的留着
            [currentStr deleteCharactersInRange:NSMakeRange(0, 1)];
            NSLog(@"i:%zd currentStr delete:%@", i, currentStr);
        }
        [currentStr appendString:charStr];
        NSLog(@"i:%zd currentStr append:%@", i, currentStr);
        if (currentStr.length > maxLengthStr.length) {
            maxLengthStr = [currentStr mutableCopy]; // 这里必须是copy，否则后续逻辑会出错
            NSLog(@"-- i:%zd maxLengthStr:%@", i, maxLengthStr);
        }
    }
    return maxLengthStr.length;
}


/**
 class Solution {
     func lengthOfLongestSubstring(_ s: String) -> Int {
         var maxLengthStr = ""
         var currentStr = ""
         for char in s {
             while currentStr.contains(char) {
                //if let subRange = Range<String.Index>(NSRange(location: 0, length: 1), in: currentStr) { currentStr.removeSubrange(subRange) }
                 currentStr.remove(at: currentStr.startIndex)
             }
             currentStr.append(char)
             if currentStr.count > maxLengthStr.count {
                 maxLengthStr = currentStr
             }
         }
         return maxLengthStr.count
     }
 }
 */


@end
