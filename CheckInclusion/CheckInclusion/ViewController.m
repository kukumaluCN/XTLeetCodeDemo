//
//  ViewController.m
//  CheckInclusion
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
     567. 字符串的排列
     
     给你两个字符串 s1 和 s2 ，写一个函数来判断 s2 是否包含 s1 的排列。如果是，返回 true ；否则，返回 false 。

     换句话说，s1 的排列之一是 s2 的 子串 。

      

     示例 1：

     输入：s1 = "ab" s2 = "eidbaooo"
     输出：true
     解释：s2 包含 s1 的排列之一 ("ba").
     示例 2：

     输入：s1= "ab" s2 = "eidboaoo"
     输出：false
      

     提示：

     1 <= s1.length, s2.length <= 104
     s1 和 s2 仅包含小写字母

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/permutation-in-string
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    /**
     执行用时：
     1728 ms
     , 在所有 Swift 提交中击败了
     34.29%
     的用户
     内存消耗：
     14.1 MB
     , 在所有 Swift 提交中击败了
     61.43%
     的用户
     
     先把s1转化成字典dic1，保存每一个字母出现了多少次

     把s2转化成Array str2，因为swift的Stringindex特别慢
     创建字典dic2用作窗口
     对str2遍历，如果index < s2.count，就往字典里以dic1的方式添加，index>=s2.count之后，每记录一个就把第一个删除
     比较dic1和dic2，一旦相等返回true

     作者：weiha
     链接：https://leetcode-cn.com/problems/permutation-in-string/solution/567-zi-fu-chuan-de-pai-lie-swift-by-weih-ypmp/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     
     class Solution {
         func checkInclusion(_ s1: String, _ s2: String) -> Bool {
             var dic1: [Character : Int] = [:]
             
             for char in s1{
                 dic1.updateValue((dic1[char] ?? 0) + 1, forKey: char)
             }
             
             let str2 = Array(s2)
             var dic2: [Character : Int] = [:]
            // arr2遍历索引
             var start = -1
             
             for (index,char) in str2.enumerated(){
                // 超过窗口尺寸
                 if index >= s1.count{
                     start += 1
                     let startChar = str2[start]
                     if dic2[startChar] == 1{
                         dic2.removeValue(forKey: startChar)
                     }else{
                         dic2.updateValue((dic2[startChar] ?? 0)-1, forKey: startChar)
                     }
                 }
                // 记录当前窗口字符频次
                 dic2.updateValue((dic2[char] ?? 0) + 1, forKey: char)
                 if dic1 == dic2{
                     return true
                 }
             }
             return false
         }
     }

     作者：weiha
     链接：https://leetcode-cn.com/problems/permutation-in-string/solution/567-zi-fu-chuan-de-pai-lie-swift-by-weih-ypmp/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    NSLog(@"%d", [self.class checkInclusion:@"smm" s2:@"uhlqdzjmsmdzrgcjqdevl"]);
}

+ (BOOL)checkInclusion:(NSString *)s1 s2:(NSString *)s2
{
    if (s2.length < s1.length) {
        return NO;
    } else {
        // 计算窗口字符频次
        NSMutableDictionary <NSString *, NSNumber *>*dic1 = [NSMutableDictionary dictionary];
        for (NSInteger i = 0; i < s1.length; i ++) {
            NSString *charStr = [NSString stringWithFormat:@"%c", [s1 characterAtIndex:i]];
            NSInteger cur = [dic1[charStr] integerValue];
            dic1[charStr] = cur ? @(cur + 1) : @1;
        }
        NSLog(@"dic1 - %@", dic1);
        
        // 滑动窗口
        for (NSInteger i = 0; i <= (s2.length - s1.length); i ++) {
            NSInteger from = i;
//            NSInteger to = i + s1.length;
            NSString *temp = [s2 substringWithRange:NSMakeRange(from, s1.length)];
            NSLog(@"temp - %@", temp);
            // 窗口筛选频次
            NSMutableDictionary <NSString *, NSNumber *>*dic2 = [NSMutableDictionary dictionary];
            for (NSInteger j = 0; j < temp.length; j ++) {
                NSString *charStr = [NSString stringWithFormat:@"%c", [temp characterAtIndex:j]];
                NSInteger cur = [dic2[charStr] integerValue];
                dic2[charStr] = cur ? @(cur + 1) : @1;
            }
            NSLog(@"dic2 - %@", dic2);
            if ([dic1 isEqualToDictionary:dic2]) {
                return YES;
            }
        }
        return NO;
    }
}


/**
 执行用时：
 2348 ms
 , 在所有 Swift 提交中击败了
 20.00%
 的用户
 内存消耗：
 14 MB
 , 在所有 Swift 提交中击败了
 61.43%
 的用户
 
 class Solution {
     func checkInclusion(_ s1: String, _ s2: String) -> Bool {
         if s2.count < s1.count {
             return false
         } else {
             // 计算窗口字符频次
             var dic1: [Character: Int] = [:]
             for char in s1{
                 dic1.updateValue((dic1[char] ?? 0) + 1, forKey: char)
             }
             
             let arr2 = Array(s2)
             // 滑动窗口
             for index in 0...(arr2.count - s1.count) {
                 let from = index
                 let to = index+s1.count
                 let temp = arr2[from..<to]
                 var dic2: [Character: Int] = [:]
                 for tempChar in temp {
                     dic2.updateValue((dic2[tempChar] ?? 0) + 1, forKey: tempChar)
                 }
                 print(dic2)
                 if dic2 == dic1 {
                     return true
                 }
             }
             return false
         }
     }
 }
 */


/**
 // 暴力排序，太耗时了。。。
 func checkInclusion(_ s1: String, _ s2: String) -> Bool {
     if s2.count < s1.count {
         return false
     } else if (s2.count == s1.count) {
         return Array(s1.reversed()).sorted() == Array(s2.reversed()).sorted()
     } else {
         let sortS1 = Array(s1.reversed()).sorted()
         for index in 0...(s2.count-s1.count) {
             // 截取窗口串
             let from = s2.index(s2.startIndex, offsetBy: index)
             let to = s2.index(from, offsetBy: s1.count)
             let temp = s2[from..<to]
             if Array(temp.reversed()).sorted() == sortS1 {
                 return true
             }
         }
         return false
     }
 }
 */

/** string.index太耗时了。。。
 func checkInclusion(_ s1: String, _ s2: String) -> Bool {
     if s2.count < s1.count {
         return false
     } else {
         var dic1 = [Character: Int]()
         for char in s1 {
             dic1.updateValue((dic1[char] ?? 0) + 1, forKey: char)
         }
         for index in 0...(s2.count-s1.count) {
             // 截取窗口串
             let from = s2.index(s2.startIndex, offsetBy: index)
             let to = s2.index(from, offsetBy: s1.count)
             let temp = s2[from..<to]
             var window = [Character: Int]()
             for tempChar in temp {
                 window.updateValue((window[tempChar] ?? 0) + 1, forKey: tempChar)
             }
             if window == dic1 {
                 return true
             }
         }
         return false
     }
 }
 */

@end
