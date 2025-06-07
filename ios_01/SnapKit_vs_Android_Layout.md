

SnapKit 让你用更简单的方式在 Swift 代码里设置界面元素的位置和大小。忘掉繁琐的 `NSLayoutConstraint` 吧！

## 1. 基本用法：`snp.makeConstraints`

这是最常用的！告诉 SnapKit 你要开始给某个视图（比如 `myView`）添加约束了。

```swift
myView.snp.makeConstraints { (make) in
    // 在这里写约束规则
}
```

*   `myView`: 你想要布局的那个 `UIView` 对象 (UILabel, UIButton, UIImageView 等都是 UIView)。
*   `make`: 一个“约束制造者”，你用它来描述具体的约束规则。

## 2. 定位和尺寸：链式调用

在 `{}` 里面，用 `make` 点上你想要的属性，然后设置它们的值。

**常用属性 (可以想象成视图的“边”和“中心点”)：**

*   `top`: 上边
*   `bottom`: 下边
*   `left` / `leading`: 左边 (leading 更常用，会自动适应从右到左的语言)
*   `right` / `trailing`: 右边 (trailing 更常用)
*   `centerX`: 水平中心
*   `centerY`: 垂直中心
*   `width`: 宽度
*   `height`: 高度

**如何设置值：**

    *   `.equalTo(目标)`: 等于某个值，或者等于另一个视图的某个边/中心。
    *   `make.width.equalTo(100)`: 宽度等于 100。
    *   `make.top.equalTo(superview.snp.top)`: 上边和父视图的上边对齐。
    *   `make.leading.equalTo(anotherView.snp.trailing)`: 左边和另一个视图的右边对齐。
    *   `.equalToSuperview()`: 等于父视图的对应属性 (是个快捷方式)。
    *   `make.center.equalToSuperview()`: 在父视图中居中。
    *   `make.edges.equalToSuperview()`: 四条边都贴着父视图 (铺满父视图)。

**示例：让 `myView` 靠在父视图顶部，左右贴边，高度为 50**

```swift
myView.snp.makeConstraints { (make) in
    make.top.equalToSuperview()       // 上边贴着父视图顶部
    make.leading.equalToSuperview()   // 左边贴着父视图左边
    make.trailing.equalToSuperview()  // 右边贴着父视图右边
    make.height.equalTo(50)       // 高度是 50
}
```

## 3. 间距：`offset` 和 `inset`

    *   `.offset(值)`: 在 `.equalTo()` 之后用，表示偏移量。
    *   `make.top.equalTo(superview.snp.top).offset(20)`: 距离父视图顶部 20。
    *   `make.leading.equalTo(anotherView.snp.trailing).offset(10)`: 距离 `anotherView` 右边 10。
    *   `.inset(值)`: 主要用在 `edges` 上，表示内边距。
    *   `make.edges.equalToSuperview().inset(10)`: 四边都距离父视图边缘 10。

**示例：`myView` 在父视图中，上下左右都有 10 的边距**

```swift
myView.snp.makeConstraints { (make) in
    make.edges.equalToSuperview().inset(10)
}
```



## 4. 组合属性 (快捷方式)

    *   `edges`: 同时设置 `top`, `bottom`, `leading`, `trailing`。
    *   `size`: 同时设置 `width`, `height`。
    *   `make.size.equalTo(CGSize(width: 100, height: 50))`: 宽高分别为 100 和 50。
    *   `make.size.equalTo(anotherView)`: 和 `anotherView` 一样大。
    *   `center`: 同时设置 `centerX`, `centerY`。
    *   `make.center.equalTo(anotherView)`: 和 `anotherView` 中心对齐。

**示例：`myView` 宽高都是 100，并在父视图中居中**

```
    myView.snp.makeConstraints { (make) in
    make.size.equalTo(100)          // 宽高都设为 100 (如果只传一个值给 size)
    make.center.equalToSuperview()
}
```

## 5. 更新和移除约束

*   `snp.updateConstraints { (make) in ... }`: 修改已存在的约束的值 (比如改 `offset`)。
*   `snp.remakeConstraints { (make) in ... }`: 清掉这个视图所有旧的 SnapKit 约束，然后重新添加新的。
*   `snp.removeConstraints()`: 清掉这个视图所有旧的 SnapKit 约束。

## 核心思想：描述关系

用 SnapKit 就是在描述 “A视图的某条边/中心点” **等于/大于/小于** “B视图的某条边/中心点 (或者一个固定值)”，可能再加一点点 **偏移 (offset/inset)**。

--- 


        
