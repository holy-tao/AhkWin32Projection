#Requires AutoHotkey v2.0

#Include ../Yunit/Yunit.ahk
#Include ../YunitExtensions/Assert.ahk

#Import  "../../Windows/Win32/Foundation/RECT.ahk" { RECT }
#Import  "../../Windows/Win32/Foundation/POINT.ahk" { POINT }

class RectExtensionTests {

    height_Get_Always_CalculatesHeight(){
        test := RECT()
        test.top := 0, test.bottom := 10

        Yunit.Assert(test.height == 10)
    }

    width_Get_Always_CalculateWidth(){
        test := RECT()
        test.right := 10

        Yunit.Assert(test.width == 10)
    }

    area_Get_Always_CalculatesArea(){
        test := RECT()
        test.bottom := 10
        test.right := 10

        Yunit.Assert(test.area == 100)
    }

    Intersect_WithIntersectingRects_ReturnsIntersection(){
        test1 := RECT()
        test1.bottom := 10
        test1.right := 10
    
        test2 := RECT()
        test2.top := 5
        test2.bottom := 15
        test2.left := 5
        test2.right := 15

        intersection := test1.Intersect(test2)

        Assert.IsType(intersection, RECT)
        Yunit.Assert(intersection.top == 5)
        Yunit.Assert(intersection.bottom == 10)
        Yunit.Assert(intersection.left == 5)
        Yunit.Assert(intersection.right == 10)
    }

    Intersect_WithNonIntersectingRects_ReturnsEmptyRect(){
        test1 := RECT()
        test1.bottom := 5
        test1.right := 5

        test2 := RECT()
        test2.top := 10
        test2.bottom := 15
        test2.left := 10
        test2.right := 15

        intersection := test1.Intersect(test2)

        Assert.IsType(intersection, RECT)
        Yunit.Assert(intersection.top == 0)
        Yunit.Assert(intersection.bottom == 0)
        Yunit.Assert(intersection.left == 0)
        Yunit.Assert(intersection.right == 0)
    }

    Union_WithRects_ReturnsUnion(){
        test1 := RECT()
        test1.top := 0
        test1.bottom := 5
        test1.left := 0
        test1.right := 5

        test2 := RECT()
        test2.top := 10
        test2.bottom := 15
        test2.left := 10
        test2.right := 15

        union := test1.Union(test2)

        Assert.IsType(union, RECT)
        Yunit.Assert(union.top == 0)
        Yunit.Assert(union.bottom == 15)
        Yunit.Assert(union.left == 0)
        Yunit.Assert(union.right == 15)
    }

    ; Using the example from the remarks here: https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-subtractrect
    Subtract_WithFullyContainedRect_ReturnsDifference(){
        test1 := RECT()
        test1.left := 10
        test1.top := 10
        test1.right := 100
        test1.bottom := 100

        test2 := RECT()
        test2.left := 50
        test2.top := 10
        test2.right := 150
        test2.bottom := 150

        diff := test1.Subtract(test2) 

        Assert.IsType(diff, RECT)
        Yunit.Assert(diff.left == 10)
        Yunit.Assert(diff.top == 10)
        Yunit.Assert(diff.right == 50)
        Yunit.Assert(diff.bottom == 100)
    }

    Equals_WithEqualRects_ReturnsTrue(){
        test1 := RECT()
        test1.left := 10
        test1.top := 10
        test1.right := 100
        test1.bottom := 100

        test2 := RECT()
        test2.left := 10
        test2.top := 10
        test2.right := 100
        test2.bottom := 100

        Yunit.Assert(test1.Equals(test2))
    }

    Equals_WithNonEqualRects_ReturnsTrue(){
        test1 := RECT()
        test1.left := 10
        test1.top := 10
        test1.right := 100
        test1.bottom := 100

        test2 := RECT()
        test2.left := 50
        test2.top := 10
        test2.right := 150
        test2.bottom := 150

        Yunit.Assert(!test1.Equals(test2))
    }

    IsEmpty_WithEmptyRect_ReturnsTrue(){
        empty := RECT()
        empty2 := RECT()
        empty2.left := 10
        empty2.top := 10
        empty2.right := 10
        empty2.bottom := 10

        Yunit.Assert(empty.isEmpty)
        Yunit.Assert(empty2.isEmpty)
    }

    IsEmpty_WithNonEmptyRect_ReturnsFalse(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20

        Yunit.Assert(!test.isEmpty)
    }

    Offset_Always_OffsetsRect(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20
        test.Offset(5, 5)

        Yunit.Assert(test.left == 15)
        Yunit.Assert(test.top == 15)
        Yunit.Assert(test.right == 25)
        Yunit.Assert(test.bottom == 25)
    }

    Inflate_Always_InflatesRect(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20
        
        test.Inflate(5, 5)

        Yunit.Assert(test.left == 5)
        Yunit.Assert(test.top == 5)
        Yunit.Assert(test.right == 25)
        Yunit.Assert(test.bottom == 25)
    }

    HitTest_WithIntersectingPoint_ReturnsTrue(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20
        pt := POINT()
        pt.x := 15
        pt.y := 15

        Yunit.Assert((val := test.HitTest(pt)), "Got " . val)
    }

    HitTest_WithNonIntersectingPoint_ReturnsFalse(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20
        pt := POINT()

        Yunit.Assert((val := !test.HitTest(pt)), "Got " . val)
    }

    HitTest_WithIntersectingCoords_ReturnsTrue(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20

        Yunit.Assert((val := test.HitTest(15, 15)), "Got " . val)
    }

    HitTest_WithNonIntersectingCoords_ReturnsFalse(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20

        Yunit.Assert(!(val := test.HitTest(0, 0)), "Got " . val)
    }

    ToString_Always_ReturnsString(){
        test := RECT()
        test.left := 10
        test.top := 10
        test.right := 20
        test.bottom := 20

        expected := "(10, 10) - (20, 20)"
        str := String(test)

        Yunit.Assert(str == expected, Format("Expected '{1}' but got '{2}'", expected, str))
    }
}