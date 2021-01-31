//
//  main.m
//  practiceForOC
//
//  Created by Gonzalez on 2021/1/31.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSFileManager中有一个叫做defaultManager的类方法，可以创建一个NSFileManager对象。
        NSFileManager *manager;
        manager=[NSFileManager defaultManager];
        
        //NSString中有一个方法可以接受～字符并将其展开成主目录路径。
        NSString *home;
        home=[@"~" stringByExpandingTildeInPath];
        
        //将路径字符串传递给文件管理器。
        NSDirectoryEnumerator *direnum;
        direnum=[manager enumeratorAtPath:home];
        
        //我们创建一个可变数组并将查找到的路径添加进去。
        NSMutableArray *files;
        files=[NSMutableArray arrayWithCapacity:42];
        
        //每次在这个枚举器对象中调用nextObject方法时，都会返回该目录中下一个文件的路径。
        //这个方法也能搜索子目录中的文件。迭代循环结束时，你将会得到主目录中每一个文件的路径。
        NSString *filename;
        while(filename=[direnum nextObject])
        {
            if([[filename pathExtension] isEqualTo: @"jpg"])
            {
                [files addObject:filename];
            }
        }
        NSEnumerator *fileenum;
        fileenum=[files objectEnumerator];
        
        while (filename=[fileenum nextObject])
        {
            NSLog(@"%@", filename);
        }
    }
    return 0;
}
