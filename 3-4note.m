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
//���������г���ÿ�����������ơ���������ֵ�����ͺ�ĳЩ������
//ǰ��Ķ��������ֺ���ԭ�ͺͷ���������һ�ַ�ʽ��
-(void) setFillColor: (ShapeColor) fillColor;
-(void) setBounds: (ShapeRect) bounds;
-(void) draw;
@end
//���ж��߱���������һ���·�����������
//������������setFillColor:����β����ð�������Ƶ�һ���֣������߱������ͱ����Ա�������ֲ�����
//��������������Բ������ָ���ġ�����ĳ��ShapeColorö��ֵ��
//������������fillColor�ǲ������������ڷ�����������ʹ�ø��������ò�����

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
    //id��һ�ַ��ͣ��������������κ����͵Ķ���
    //������һ�ְ��������struct�ṹ�壬���idʵ������һ��ָ��ṹ���ָ�롣
    id shapes[4];
    ShapeRect rect0 = {0, 0, 10, 30};
    shapes[0] = [Circle new];
    [shapes[0] setBounds:rect0];
    [shapes[0] setFillColor:kRedColor];
    //����������֪ͨĳ������ȥ��ʲô��
    //��������ĵ�һ���Ƕ������ಿ������Ҫ����ִ�еĲ�����
    //֪ͨ����ִ��ĳ�ֲ�����Ϊ������Ϣ����÷�����
    //����[shape draw]��ʾ��shape��������draw��Ϣ��

    drawShapes(shapes, 1);
}
