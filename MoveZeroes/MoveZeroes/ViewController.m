//
//  ViewController.m
//  MoveZeroes
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
     283. 移动零
     
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     示例:

     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:

     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/move-zeroes
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
//    NSMutableArray *nums = @[@0,@1,@0,@3,@12].mutableCopy;
    NSMutableArray *nums = @[@0,@0,@1].mutableCopy;
    NSLog(@"nums - %@", nums);
    [self.class moveZeroes:&nums];
    NSLog(@"nums - %@", nums);
}

+ (void)moveZeroes:(NSMutableArray <NSNumber *>**)nums
{
    NSMutableArray <NSNumber *>*arr = *nums;
    // 删除替换法，错误，不能解决连续两个0在前面的问题
//    [arr enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (obj.integerValue == 0) {
//            //nums.append(0)
//            //nums.remove(at: index)
//            NSLog(@"arr - %zd - %@", idx, arr);
//            arr[arr.count] = obj;
//            NSLog(@"arr - %zd - %@", idx, arr);
//            [arr removeObjectAtIndex:idx];
//            NSLog(@"arr - %zd - %@", idx, arr);
//        }
//    }];
    //双指针，通过i查找非0的值，j标记0的位置，当i找到非0值，且i>j(即非0值在右侧)时将非0和0交换。
    // https://leetcode-cn.com/problems/move-zeroes/solution/dong-hua-yan-shi-283yi-dong-ling-by-wang_ni_ma/
    __block NSInteger idx0 = 0;
    [arr enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.integerValue != 0) {
            NSLog(@"arr - %zd/%zd - %@", idx, idx0, arr);
            [arr exchangeObjectAtIndex:idx withObjectAtIndex:idx0];
            idx0 += 1;
            NSLog(@"arr - %zd/%zd - %@", idx, idx0, arr);
        }
    }];
}

/**
 class Solution {
     func moveZeroes(_ nums: inout [Int]) {
         var last0Index = 0
         for index in 0..<nums.count {
             let current = nums[index]
             if current != 0 {
                 nums.swapAt(index, last0Index)
                 last0Index += 1
             }
         }
     }
 }
 */


@end
