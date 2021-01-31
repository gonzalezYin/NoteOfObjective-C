#import <Foundation/Foundation.h>

typedef enum{
    kRedColor;
    kGreenColor;
    kBlueColor;
}ShapeColor;

typedef struct {
    int x, y, width, height;
}ShapeRect;

NSString *colorName(ShapeColor color){
    NSString *colorName;
    switch (color){
        case kRedColor:
            colorName=@"red";
            break;
        case kGreenColor:
            colorName=@"green";
            break;
        case kBlueColor:
            colorName=@"blue";
            break;
        default:
            colorName=@"oops!Unexpected color";
            break;
    }
    return (colorName);
}


//Shapes base class
@interface Shape : NSObject{
    ShapeColor fillColor;
    ShapeRect bounds;
}
//方法声明列出了每个方法的名称、方法返回值的类型和某些参数。
//前面的短线是区分函数原型和方法声明的一种方式。
-(void) setFillColor: (ShapeColor) fillColor;
-(void) setBounds: (ShapeRect) bounds;
-(void) draw;
@end
//先行短线表明“这是一个新方法的声明”
//方法的名称是setFillColor:，结尾处的冒号是名称的一部分，它告诉编译器和编程人员后面会出现参数。
//参数的类型是在圆括号中指定的。它是某个ShapeColor枚举值。
//紧随其后的名称fillColor是参数名，可以在方法的主体中使用该名称引用参数。

@implementation Shape
- (void) setFillColor: (ShapeColor) c{
    fillColor=c;
}
- (void) setBounds: (ShapeRect) b{
    bounds=b;
}
- (void) draw{
}
@end


//All about Triangles
@interface Triangle : Shape
@end

@implementation Triangle
- (void) draw{
    NSLog(@"drawing a triangle at (%d %d %d %d) in %@",
            bounds.x, bounds.y,
            bounds.width, bounds.height,
            colorName(fillColor));
}
@end


//All about Circles
@interface Circle : Shape
@end
@implementation Circle
-(void) draw{
    NSLog(@"drawing a circle at (%d %d %d %d) in %@",
            bounds.x, bounds.y,
            bounds.width, bounds.height,
            colorName(fillColor));
}
@end


/All about Rectangle
@interface Rectangle : Shape
@end
@implementation Rectangle
-(void) draw{
    NSLog(@"drawing a rectangle at (%d %d %d %d) in %@",
            bounds.x, bounds.y,
            bounds.width, bounds.height,
            colorName(fillColor));
}
@end

void drawShapes(id shapes[], int count){
    for(int i=0; i<count; i++){
        id shape = shapes[i];
        [shape draw];
    }
}

int main(int argc, const char* argv[]){
    //id是一种泛型，可以用来引用任何类型的对象。
    //对象是一种包含代码的struct结构体，因此id实际上是一个指向结构体的指针。
    id shapes[4];
    ShapeRect rect0 = {0, 0, 10, 30};
    shapes[0] = [Circle new];
    [shapes[0] setBounds:rect0];
    [shapes[0] setFillColor:kRedColor];
    //方括号用于通知某个对象去做什么。
    //方括号里的第一项是对象，其余部分是需要对象执行的操作。
    //通知对象执行某种操作称为发送消息或调用方法。
    //代码[shape draw]表示向shape对象发送了draw消息。

    drawShapes(shapes, 1);
}
