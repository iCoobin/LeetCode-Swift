//
//  medium.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

/// 8. 字符串转换整数 (atoi)
/*
 请你来实现一个 myAtoi(string s) 函数，使其能将字符串转换成一个 32 位有符号整数（类似 C/C++ 中的 atoi 函数）。

 函数 myAtoi(string s) 的算法如下：

 读入字符串并丢弃无用的前导空格
 检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
 读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
 将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
 如果整数数超过 32 位有符号整数范围 [−231,  231 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −231 的整数应该被固定为 −231 ，大于 231 − 1 的整数应该被固定为 231 − 1 。
 返回整数作为最终结果。
 注意：

 本题中的空白字符只包括空格字符 ' ' 。
 除前导空格或数字后的其余字符串外，请勿忽略 任何其他字符。
  

 示例 1：

 输入：s = "42"
 输出：42
 解释：加粗的字符串为已经读入的字符，插入符号是当前读取的字符。
 第 1 步："42"（当前没有读入字符，因为没有前导空格）
          ^
 第 2 步："42"（当前没有读入字符，因为这里不存在 '-' 或者 '+'）
          ^
 第 3 步："42"（读入 "42"）
            ^
 解析得到整数 42 。
 由于 "42" 在范围 [-231, 231 - 1] 内，最终结果为 42 。
 示例 2：

 输入：s = "   -42"
 输出：-42
 解释：
 第 1 步："   -42"（读入前导空格，但忽视掉）
             ^
 第 2 步："   -42"（读入 '-' 字符，所以结果应该是负数）
              ^
 第 3 步："   -42"（读入 "42"）
                ^
 解析得到整数 -42 。
 由于 "-42" 在范围 [-231, 231 - 1] 内，最终结果为 -42 。
 示例 3：

 输入：s = "4193 with words"
 输出：4193
 解释：
 第 1 步："4193 with words"（当前没有读入字符，因为没有前导空格）
          ^
 第 2 步："4193 with words"（当前没有读入字符，因为这里不存在 '-' 或者 '+'）
          ^
 第 3 步："4193 with words"（读入 "4193"；由于下一个字符不是一个数字，所以读入停止）
              ^
 解析得到整数 4193 。
 由于 "4193" 在范围 [-231, 231 - 1] 内，最终结果为 4193 。
  

 提示：

 0 <= s.length <= 200
 s 由英文字母（大写和小写）、数字（0-9）、' '、'+'、'-' 和 '.' 组成

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/string-to-integer-atoi
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_8 {
    
    func myAtoi(_ s: String) -> Int {
        var s = String(s.drop(while: { $0 == " "}))
        var positive = true
        if s.first == "+" {
            s.removeFirst()
        } else if s.first == "-" {
            s.removeFirst()
            positive = false
        }
        s = String(s.prefix(while: { $0.isNumber }))
        if s.count < 1 {
            return 0
        }
        guard var numValue = Double(s) else {
            return 0
        }
        let maxM = Double(Int32.max)
        let minM = Double(Int32.min)
        numValue = positive ? numValue : -numValue
        if numValue > maxM {
            return Int(Int32.max)
        } else if numValue < minM {
            return Int(Int32.min)
        } else if let numValue = Int(s) {
            return positive ? numValue : -numValue
        } else {
            return 0
        }
    }
    
}


/// 7. 整数反转
/*
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
  

 示例 1：

 输入：x = 123
 输出：321
 示例 2：

 输入：x = -123
 输出：-321
 示例 3：

 输入：x = 120
 输出：21
 示例 4：

 输入：x = 0
 输出：0
  

 提示：

 -231 <= x <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_7 {
    
    /// 解题思路：数学取模法
    /// - 时间复杂度 O(n) n为位数
    /// - 空间复杂度 O(1)
    func reverse(_ x: Int) -> Int {
        
        var num = abs(x)
        var ans: Int = 0
        while num > 0 {
            ans = ans * 10 + num % 10
            num /= 10
        }
        ans = x < 0 ? -ans : ans
        return (ans >= Int32.min && ans <= Int32.max ) ? ans : 0
    }
}


//MARK: - 238. 除自身以外数组的乘积
/*
 给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积 。

 题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。

 请不要使用除法，且在 O(n) 时间复杂度内完成此题。

 示例 1:

 输入: nums = [1,2,3,4]
 输出: [24,12,8,6]
 示例 2:

 输入: nums = [-1,1,0,-3,3]
 输出: [0,0,9,0,0]
  

 提示：

 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内
  

 进阶：你可以在 O(1) 的额外空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/product-of-array-except-self
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_238 {
    
    /// 空间复杂度 O(1) 的方法
    /// 由于输出数组不算在空间复杂度内，那么我们可以将 L 或 R 数组用输出数组来计算
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        var answer = Array(repeating: 0, count: nums.count)
        
        answer[0] = 1
        for i in 1..<nums.count {
            answer[i] = answer[i-1] * nums[i-1]
        }
        
        var right = 1
        for i in (0..<nums.count).reversed() {
            answer[i] = answer[i] * right
            right *= nums[i]
        }
        return answer
    }
    
    /// 解题思路：左右乘积列表
    func productExceptSelf11(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        var leftArray = Array(repeating: 0, count: nums.count)
        var rightArray = Array(repeating: 0, count: nums.count)
        var answerArray = Array(repeating: 0, count: nums.count)
        leftArray[0] = 1
        rightArray[nums.count-1] = 1
        for i in 1..<nums.count {
            leftArray[i] = nums[i-1] * leftArray[i-1]
        }
        for i in (0..<nums.count-1).reversed() {
            rightArray[i] = nums[i+1] * rightArray[i+1]
        }
        for i in 0..<nums.count {
            answerArray[i] = leftArray[i] * rightArray[i]
        }
        return answerArray
    }
}


//MARK: - 237. 删除链表中的节点
/*
 有一个单链表的 head，我们想删除它其中的一个节点 node。

 给你一个需要删除的节点 node 。你将 无法访问 第一个节点  head。

 链表的所有值都是 唯一的，并且保证给定的节点 node 不是链表中的最后一个节点。

 删除给定的节点。注意，删除节点并不是指从内存中删除它。这里的意思是：

 给定节点的值不应该存在于链表中。
 链表中的节点数应该减少 1。
 node 前面的所有值顺序相同。
 node 后面的所有值顺序相同。
 自定义测试：

 对于输入，你应该提供整个链表 head 和要给出的节点 node。node 不应该是链表的最后一个节点，而应该是链表中的一个实际节点。
 我们将构建链表，并将节点传递给你的函数。
 输出将是调用你函数后的整个链表。
  

 示例 1：


 输入：head = [4,5,1,9], node = 5
 输出：[4,1,9]
 解释：指定链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9
 示例 2：


 输入：head = [4,5,1,9], node = 1
 输出：[4,5,9]
 解释：指定链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/delete-node-in-a-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_237 {
        
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    /// 解题思路：单向遍历删除
    /// 把下一个节点的值赋值给当前节点
    /// 当前节点 next 指向下下节点
    /// 实际删除的是下一个节点
    /// 但是如果当前是末尾节点怎么删除呢？
    /// - 时间复杂度 O(1)
    /// - 空间复杂度 O(1)
    func deleteNode(_ node: ListNode?) {
        guard let node = node  else {
            return
        }
        node.val = node.next?.val ?? 0
        node.next = node.next?.next
    }
    
    /// 创建链表
    func buildListWith(nums: [Int], pos: Int, _ posNode: inout ListNode?) -> ListNode? {
        if nums.isEmpty {
            return nil
        }
        let head: ListNode? = ListNode(0)
        var prev: ListNode? = head
        var buildCount = 0
        
        for num in nums {
            prev?.next = ListNode(num)
            if pos == num {
                posNode = prev?.next
            }
            prev = prev?.next
            buildCount += 1
        }
        return head?.next
    }
    
    /// 链表转数组
    func arrayWith(list head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        var nums: [Int] = []
        var prev = head
        while prev != nil {
            nums.append(prev!.val)
            prev = prev?.next
        }
        return nums
    }
}

//MARK: - 236. 二叉树的最近公共祖先
/*
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 示例 1：


 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出：3
 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
 示例 2：


 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出：5
 解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。
 示例 3：

 输入：root = [1,2], p = 1, q = 2
 输出：1

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_236 {

    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    /// 优化写法：深度遍历二叉树
    /// 深度遍历找到当前 root === p || root === q 返回 root
    /// 如果左返回和右返回都不为 nil 则返回当前 root
    /// 如果左返回不为空 则返回 左
    /// 如果右返回不为空 则返回 右
    func lowestCommonAncestor(_ root: TreeNode?,
                            _ p: TreeNode?,
                            _ q: TreeNode?)
    -> TreeNode? {
        if root == nil || root === p || root === q {
            return root
        }
        let l = lowestCommonAncestor(root?.left, p, q)
        let r = lowestCommonAncestor(root?.right, p, q)
        if l != nil, r != nil { return root }
        if l != nil { return l }
        if r != nil { return r }
        return nil
    }
    
    
    /// 解题思路：深度优先搜索（遍历所有节点）
    /// 如果同事含有 p 且 q 返回当前 root 节点
    /// 使用 Swift 的 tuple 返回
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(logn)
    func lowestCommonAncestor11(_ root: TreeNode?,
                            _ p: TreeNode?,
                            _ q: TreeNode?)
    -> TreeNode? {
        guard let root = root,
             let p = p,
              let q = q else {
            return root
        }
        return dfs(root, p, q).0
    }
    
    func dfs(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> (TreeNode?,Bool) {
        guard let root  = root else {
            return (nil, false)
        }
        let lson = dfs(root.left, p, q)
        let rson = dfs(root.right, p, q)
        let currentIsHas = (root.val == p.val || root.val == q.val)
        let isHas = (lson.1 || rson.1 || currentIsHas)
        var node: TreeNode? = lson.0 ?? rson.0 ?? nil
        if ((lson.1 && rson.1) ||
            (lson.1 && currentIsHas) ||
            (rson.1 && currentIsHas)) &&
            (lson.0 == nil && rson.0 == nil){
            node = root
        }
        return (node, isHas)
    }
    
    
    
    /// 数组转树
    /// 特点是，左节点永远指向 2*i + 1， 有节点指向 2*i+2
    /// 遍历完数组就可以生成树
    func createTreeWith(array: [Int?],
                        p: Int,
                        pNode: inout TreeNode?,
                        q: Int,
                        qNode: inout TreeNode?)
    -> TreeNode? {
        if array.first == nil {
            return nil
        }
        let nodes = array.map { n in
            if let num = n {
                let node = TreeNode(num)
                if num == p {
                    pNode = node
                } else if num == q {
                    qNode = node
                }
                return Optional(node)
            } else {
                return nil
            }
        }
        
        for i in 0..<nodes.count {
            if let node = nodes[i] {
                let leftIndex = 2*i + 1
                let rightIndex = 2*i + 2
                if leftIndex < nodes.count {
                    node.left = nodes[leftIndex]
                }
                if rightIndex < nodes.count {
                    node.right = nodes[rightIndex]
                }
            }
        }
        return nodes[0]
    }
}

//MARK: - 235. 二叉搜索树的最近公共祖先
/*
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]

 示例 1:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 输出: 6
 解释: 节点 2 和节点 8 的最近公共祖先是 6。
 示例 2:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 输出: 2
 解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。
  
 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉搜索树中。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_235 {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    /// 解题思路：深度优先搜索 （while 法）
    /// - 时间复杂度 O(log n)
    /// - 空间复杂度 O(1)
    func lowestCommonAncestor(_ root: TreeNode?,
                          _ p: TreeNode?,
                          _ q: TreeNode?)
    -> TreeNode? {
        guard var root = root,
             let p = p,
             let q = q else {
            return nil
        }
        let min = min(p.val, q.val)
        let max = max(p.val, q.val)
        while root.val < min || root.val > max {
            if root.val < min, let right = root.right {
                root = right
            } else if root.val > max, let left = root.left {
                root = left
            } else {
                break
            }
        }
        return root
    }
    
    
    /// 解题思路：深度优先搜索 （递归法）
    /// root 节点肯定是 p 和 q 的公共祖节点
    /// 深度优先搜索，先遍历左右节点，在遍历自己节点。
    /// 直到不没有公共节点时，记录当前节点
    /// f(f(n,n2),f(n,n2)) 如果 f(n1,n2) 有公共节点，则返回 f(n1,n2)的节点
    /// p、q 先区分min、max。
    /// 如何 root 小于 min，则使用右子树
    /// 如果 root 大于 max，则使用左子树
    /// 否则返回当前子树
    /// - 时间复杂度 O(logn)
    /// - 空间复杂度 O(lonn)
    func lowestCommonAncestor11(_ root: TreeNode?,
                          _ p: TreeNode?,
                          _ q: TreeNode?)
    -> TreeNode? {
        guard let p = p, let q = q, p.val != q.val else {
            return p
        }
        guard let root = root else {
            return root
        }
        let min = p.val < q.val ? p : q
        let max = p.val < q.val ? q : p
        return dfs(root, min: min, max: max)
    }
    
    func dfs(_ root: TreeNode?, min: TreeNode, max: TreeNode) -> TreeNode? {
        guard let root = root else {
            return root
        }
        if root.val < min.val {
            return dfs(root.right, min: min, max: max)
        } else if root.val > max.val {
            return dfs(root.left, min: min, max: max)
        }
        return root
    }
    
    /// 数组转树
    /// 特点是，左节点永远指向 2*i + 1， 有节点指向 2*i+2
    /// 遍历完数组就可以生成树
    func createTreeWith(array: [Int?],
                        p: Int,
                        pNode: inout TreeNode?,
                        q: Int,
                        qNode: inout TreeNode?)
    -> TreeNode? {
        if array.first == nil {
            return nil
        }
        let nodes = array.map { n in
            if let num = n {
                let node = TreeNode(num)
                if num == p {
                    pNode = node
                } else if num == q {
                    qNode = node
                }
                return Optional(node)
            } else {
                return nil
            }
        }
        
        for i in 0..<nodes.count {
            if let node = nodes[i] {
                let leftIndex = 2*i + 1
                let rightIndex = 2*i + 2
                if leftIndex < nodes.count {
                    node.left = nodes[leftIndex]
                }
                if rightIndex < nodes.count {
                    node.right = nodes[rightIndex]
                }
            }
        }
        return nodes[0]
    }
}


//MARK: - 230. 二叉搜索树中第K小的元素
/*
 给定一个二叉搜索树的根节点 root ，和一个整数 k ，请你设计一个算法查找其中第 k 个最小元素（从 1 开始计数）。

 示例 1：

 输入：root = [3,1,4,null,2], k = 1
 输出：1
 示例 2：


 输入：root = [5,3,6,2,4,null,null,1], k = 3
 输出：3

 提示：

 树中的节点数为 n 。
 1 <= k <= n <= 104
 0 <= Node.val <= 104
  

 进阶：如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 k 小的值，你将如何优化算法？

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/kth-smallest-element-in-a-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_230 {
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    
    /// 解题思路2：深度优先搜索
    /// 左节点 < 当前节点 < 右节点
    /// 左树优先搜索， 每个节点k - 1
    /// 当 k 等于 0 是返回当前节点数
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var k = k
        var kMinNum = 0
        dfs1(root, &k, &kMinNum)
        return kMinNum
    }
    
    func dfs1(_ root: TreeNode?, _ k: inout Int, _ kMinNum: inout Int) {
        guard let root = root else {
            return
        }
        if let left = root.left {
            dfs1(left, &k, &kMinNum)
        }
        switch k {
        case 1:
            kMinNum = root.val
            k -= 1
            break
        case let x where x > 1:
            k -= 1
            dfs1(root.right, &k, &kMinNum)
            break
        default:
            return
        }
    }
    
    
    
    /// 解题思路1：深度优先搜索
    /// 把所有遍历到的数存入 stack 中
    /// 在那 stack 数组排序
    /// 返回 stack 数组中第 k-0 个数
    /// - 时间复杂度比较差 O(n+nlogn)
    /// - 空间复杂度 O(n)
    func kthSmallest11(_ root: TreeNode?, _ k: Int) -> Int {
        guard let _ = root else {
            return 0
        }
        var stack: [Int] = []
        dfs(root, k, &stack)
        stack = stack.sorted()
        return stack.count >= k ? stack[k-1] : 0
    }
    
    func dfs(_ root: TreeNode?, _ k: Int, _ stack: inout [Int]){
        guard let root = root else {
            return
        }
        stack.append(root.val)
        dfs(root.left, k, &stack)
        dfs(root.right, k, &stack)
    }
    
    /// 数组转树
    /// 特点是，左节点永远指向 2*i + 1， 有节点指向 2*i+2
    /// 遍历完数组就可以生成树
    func createTreeWith(array: [Int?]) -> TreeNode? {
        if array.first == nil {
            return nil
        }
        let nodes = array.map { n in
            if let num = n {
                return Optional(TreeNode(num))
            } else {
                return nil
            }
        }
        
        for i in 0..<nodes.count {
            if let node = nodes[i] {
                let leftIndex = 2*i + 1
                let rightIndex = 2*i + 2
                if leftIndex < nodes.count {
                    node.left = nodes[leftIndex]
                }
                if rightIndex < nodes.count {
                    node.right = nodes[rightIndex]
                }
            }
        }
        return nodes[0]
    }
}

//MARK: - *** 5. 最长回文子串
//TODO: 未学会
/*
 给你一个字符串 s，找到 s 中最长的回文子串。

 如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。

 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
  

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_5 {
    
    /// 解法4：Manacher 算法
    /**
     Manacher算法是解决最长回文子串问题的最优解，它是一种基于回文中心的算法，可以在O(n)的时间复杂度内求解最长回文子串。

     Manacher算法的核心思想是利用已知的回文中心的信息来推导新的回文中心的信息。具体来说，我们可以维护一个回文半径数组P，其中P[i]表示以i为中心的最长回文半径。

     在计算P[i]的过程中，我们可以利用已知的回文半径来快速计算P[i]的值。具体来说，我们可以维护两个变量，分别表示当前已知的最右回文边界R和最右回文边界对应的回文中心C。在计算P[i]的过程中，我们可以根据i与C的距离来判断i是否在R的左侧或右侧。

     如果i在R的左侧，那么我们可以利用已知的回文中心的信息来快速计算P[i]的初值，然后向左右两侧扩展，直到找到最长的回文半径。

     如果i在R的右侧，那么我们只能暴力扩展，直到找到最长的回文半径。

     在计算P[i]的过程中，我们还需要维护一个变量maxRight，表示已知的回文半径的最右边界。如果i+P[i]超过了maxRight，那么我们需要更新maxRight和C的值。

     时间复杂度为O(n)，空间复杂度为O(n)。
     */
    
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty {
            return s
        }
        
        let arr = Array(s)
        
        var maxLength = 1
        var beginP = 0
        var i = 0
        
        while i < arr.count {
            var l = i - 1
            var r = i
            while r < arr.count && arr[i] == arr[r] {
                r += 1
            }
            i = r
            while l >= 0 && r < arr.count && arr[l] == arr[r] {
                l -= 1
                r += 1
            }
            
            let length = (r-l-1)
            if length > maxLength {
                maxLength = length
                beginP = l+1
            }
        }
        
        let subStr: Substring = s.dropFirst(beginP).prefix(maxLength)
        print("\(subStr)")
        
        return String(subStr)
    }
    
    /// 解法3：中心扩展法
    /// 中心扩展法是一种优化的枚举方法，我们可以枚举所有的回文中心，然后向两边扩展，直到找到最长的回文串。
    /// 回文中心有两种情况，一种是一个字符，另一种是两个相邻的字符。因此，我们可以枚举所有的字符和相邻的字符，将他们当作回文中心，然后向两边扩展。
    /// - 时间复杂度 O(n^2)
    /// - 空间复杂度 O(1)
    func longestPalindrome13(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var ans = ""
        func expandAroundCenter(_ left: Int, _ right: Int) -> String {
            var l = left, r = right
            while l >= 0 && r < n && chars[l] == chars[r] {
                l -= 1
                r += 1
            }
            return String(chars[l+1..<r])
        }
        
        for i in 0..<n {
            let s1 = expandAroundCenter(i, i)
            let s2 = expandAroundCenter(i, i+1)
            if s1.count > ans.count {
                ans = s1
            }
            if s2.count > ans.count {
                ans = s2
            }
        }
        return ans
    }
    
    
    ///解法2: 动态规划  (LeetCode 测试超时，可能是内存使用太多导致)
    ///动态规划是解决最长回文子串问题的最优解，我们可以定义一个二维数组 dp，其中 dp[i][j]表示从i到j的子串是否是回文串。
    ///状态转移方程如下：
    ///当i==j时，dp[i][j] = true
    ///当i+1==j时，dp[i][j] = s[i] == s[j]
    ///当i+1<j时，dp[i][j] = dp[i+1][j-1] && s[i] == s[j]
    ///其中，dp[i+1][j-1]表示去掉s[i]和s[j]之后的子串是否是回文串。
    ///- 时间复杂度为 O(n^2)
    ///- 空间复杂度为 O(n^2)
    func longestPalindrome12(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var ans = ""
        
        for i in (0..<n).reversed() {
            for j in i..<n {
                dp[i][j] = (chars[i] == chars[j]  && (j-i <= 2 || dp[i+1][j-1]))
                if dp[i][j] && j-i+1 >= ans.count {
                    ans = String(chars[i...j])
                }
            }
        }
        return ans
    }
    
    
    /// 解法1：暴力枚举 （LeetCode 超时）
    /// 暴力枚举是最简单的方法，我们可以枚举所有的子串，判断它是否是回文串，并记录最长的回文串
    /// - 时间复杂度 O(n^3)
    /// - 空间复杂度 O(1)
    func longestPalindrome11(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var ans = ""
        for i in 0..<n {
            for j in i..<n {
                var isPalindrome = true
                for k in 0..<(j-i+1)/2 {
                    if chars[i+k] != chars[j-k] {
                        isPalindrome = false
                        break
                    }
                }
                if isPalindrome && j-i+1 > ans.count {
                    ans = String(chars[i...j])
                }
            }
        }
        return ans
    }

}

//MARK: - 2. 两数相加
/*
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

  

 示例 1：


 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_2 {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    /// 遍历链表就好了
    /// 分别把两个链表压栈
    /// 再出栈相加创建新的链表
    /// - 时间复杂度 O(max(m,n))
    /// - 空间复杂度 O(1)
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let newList = ListNode(0)
        var curPrev: ListNode?
        var prev1 = l1
        var prev2 = l2
        while prev1 != nil && prev2 != nil {
            newList.val += prev1!.val + prev2!.val
            let node = ListNode(newList.val % 10)
            newList.val /= 10
            if newList.next == nil {
                newList.next = node
            }
            curPrev?.next = node
            curPrev = node
            prev1 = prev1?.next
            prev2 = prev2?.next
        }
        
        var notEmp = prev1 == nil ? prev2 : prev1
        while notEmp != nil {
            newList.val += notEmp!.val
            let node = ListNode(newList.val % 10)
            newList.val /= 10
            if newList.next == nil {
                newList.next = node
            }
            curPrev?.next = node
            curPrev = node
            notEmp = notEmp?.next
        }
        
        if newList.val > 0 {
            curPrev?.next = ListNode(newList.val)
        }
        return newList.next
    }
    
    /// 数组创建链表
    /// - Parameters:
    ///   - nums: 数组
    ///   - pos: 环点的位置， -1 则无环
    /// - Returns: head
    func buildListWith(nums: [Int], pos: Int) -> ListNode? {
        if nums.isEmpty {
            return nil
        }
        let head: ListNode? = ListNode(0)
        var prev: ListNode? = head
        var posNode: ListNode?
        var buildCount = 0
        
        for num in nums {
            prev?.next = ListNode(num)
            if buildCount == pos {
                posNode = prev?.next
            }
            prev = prev?.next
            buildCount += 1
        }
        prev?.next = posNode
        return head?.next
    }
    
    func arrayWith(list head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        var nums: [Int] = []
        var prev = head
        while prev != nil {
            nums.append(prev!.val)
            prev = prev?.next
        }
        return nums
    }
    
    
}
