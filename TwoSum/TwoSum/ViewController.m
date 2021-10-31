//
//  ViewController.m
//  TwoSum
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
     167. 两数之和 II - 输入有序数组
     
     给定一个已按照 非递减顺序排列  的整数数组 numbers ，请你从数组中找出两个数满足相加之和等于目标数 target 。

     函数应该以长度为 2 的整数数组的形式返回这两个数的下标值。numbers 的下标 从 1 开始计数 ，所以答案数组应当满足 1 <= answer[0] < answer[1] <= numbers.length 。

     你可以假设每个输入 只对应唯一的答案 ，而且你 不可以 重复使用相同的元素。

      
     示例 1：

     输入：numbers = [2,7,11,15], target = 9
     输出：[1,2]
     解释：2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
     示例 2：

     输入：numbers = [2,3,4], target = 6
     输出：[1,3]
     示例 3：

     输入：numbers = [-1,0], target = -1
     输出：[1,2]
      

     提示：

     2 <= numbers.length <= 3 * 104
     -1000 <= numbers[i] <= 1000
     numbers 按 非递减顺序 排列
     -1000 <= target <= 1000
     仅存在一个有效答案
     通过次数307,841提交次数524,768

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
//    NSArray *nums = @[@2,@7,@11,@15];
//    NSInteger target = 13;
    NSArray *nums = @[@-1,@0,@3,@5];
    NSInteger target = 3;
    NSLog(@"%@", [self.class twoSumIn:nums toTarget:target]);
}


+ (NSArray <NSNumber *>*)twoSumIn:(NSArray <NSNumber *>*)numbers toTarget:(NSInteger)target
{
    NSInteger left = 0;
    NSInteger right = numbers.count - 1;
    while (left < right) {
        NSInteger sum = [numbers[left] integerValue] + [numbers[right] integerValue];
        if (sum < target) {
            left += 1;
        } else if (sum > target) {
            right -= 1;
        } else {
            return @[@(left+1), @(right+1)];
        }
    }
    return @[@-1, @-1];
}


/**
 // 笨办法
 class Solution {
     func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
         var first = 0
         var second = 0
         for i in 0..<numbers.count {
             if second == 0 {
                 for j in i+1..<numbers.count {
                     if numbers[i] + numbers[j] == target {
                         first = i+1
                         second = j+1
                         break
                     }
                 }
             } else {
                 break
             }
         }
         return [first, second]
     }
 }
 
 // 双指针法
 class Solution {
     func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
         var first = 0
         var second = numbers.count - 1
         while first < second {
             let sum = numbers[first] + numbers[second]
             if sum < target {
                 first += 1
             } else if sum > target {
                 second -= 1
             } else {
                 return [first+1, second+1]
             }
         }
         return [-1, -1]
     }
 }
 */

@end
