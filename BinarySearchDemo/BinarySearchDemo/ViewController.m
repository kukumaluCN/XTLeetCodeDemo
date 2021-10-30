//
//  ViewController.m
//  BinarySearchDemo
//
//  Created by JXT on 2021/10/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
    704. 二分查找
     给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。
     
     示例 1:
     输入: nums = [-1,0,3,5,9,12], target = 9
     输出: 4
     解释: 9 出现在 nums 中并且下标为 4
     示例 2:
     输入: nums = [-1,0,3,5,9,12], target = 2
     输出: -1
     解释: 2 不存在 nums 中因此返回 -1

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/binary-search
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     时间复杂度可以表示O(h)=O(log2n)
     https://www.jianshu.com/p/fb7001a8e0b1
     
     
     解析：
     https://leetcode-cn.com/problems/binary-search/solution/dai-ma-sui-xiang-lu-dai-ni-xue-tou-er-fe-ajox/
     */
    
    NSArray *nums = @[@-1, @0, @3, @5, @6, @7, @9, @12, @15, @20];
    NSInteger target = 20;
    NSInteger rlt =  [self.class search:nums target:target];
    NSLog(@"rlt - %zd", rlt);
}

+ (NSInteger)search:(NSArray <NSNumber *>*)nums target:(NSInteger)target
{
    NSInteger leftIndex = 0;
    NSInteger rightIndex = nums.count - 1;
    
    while (leftIndex <= rightIndex) {
        
        // 计算区间中间的下标（如果left、right都比较大的情况下，left + right就有可能会溢出）
//        NSInteger middleIndex = (leftIndex + rightIndex) / 2;
        NSInteger middleIndex = leftIndex + (rightIndex - leftIndex) / 2;
        NSLog(@"middleIndex - %zd", middleIndex);
        NSInteger middleValue = [nums[middleIndex] integerValue];
        NSLog(@"middleValue - %zd", middleValue);
        
        if (target < middleValue) {
            rightIndex = middleIndex - 1;
            NSLog(@"target < middleValue  rightIndex - %zd", rightIndex);
        }
        else if (target > middleValue) {
            leftIndex = middleIndex + 1;
            NSLog(@"target > middleValue  leftIndex - %zd", leftIndex);
        }
        else {
            return middleIndex;
        }
    }
    return -1;
}

//func search(_ nums: [Int], _ target: Int) -> Int {
//    var left = 0
//    var right = nums.count - 1
//    while left <= right {
//        // 防止大数溢出
//        var middle = left + (right - left) / 2
//        if target < nums[middle] {
//            right = middle - 1
//        } else if target > nums[middle] {
//            left = middle + 1
//        } else {
//            return middle
//        }
//    }
//    return -1
//}

@end
