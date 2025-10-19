#Requires AutoHotkey v2.0

#Include ../Yunit/Yunit.ahk
#Include ../YunitExtensions/Assert.ahk

#Include ../../Windows/Win32/Foundation/RECT.ahk

class RectExtensionTests {

    height_Get_Always_CalculatesHeight(){
        test := RECT({top: 0, bottom: 10})

        Yunit.Assert(test.height == 10)
    }

    width_Get_Always_CalculateWidth(){
        test := RECT({right: 10, left: 0})

        Yunit.Assert(test.width == 10)
    }

    area_Get_Always_CalculatesArea(){
        test := RECT({top: 0, bottom: 10, left: 0, right: 10})

        Yunit.Assert(test.area == 100)
    }

    Intersect_WithIntersectingRects_ReturnsIntersection(){
        test1 := RECT({top: 0, bottom: 10, left: 0, right: 10})
        test2 := RECT({top: 5, bottom: 15, left: 5, right: 15})

        intersection := test1.Intersect(test2)

        Assert.IsType(intersection, RECT)
        Yunit.Assert(intersection.top == 5)
        Yunit.Assert(intersection.bottom == 10)
        Yunit.Assert(intersection.left == 5)
        Yunit.Assert(intersection.right == 10)
    }

    Intersect_WithNonIntersectingRects_ReturnsEmptyRect(){
        test1 := RECT({top: 0, bottom: 5, left: 0, right: 5})
        test2 := RECT({top: 10, bottom: 15, left: 10, right: 15})

        intersection := test1.Intersect(test2)

        Assert.IsType(intersection, RECT)
        Yunit.Assert(intersection.top == 0)
        Yunit.Assert(intersection.bottom == 0)
        Yunit.Assert(intersection.left == 0)
        Yunit.Assert(intersection.right == 0)
    }

    Union_WithRects_ReturnsUnion(){
        test1 := RECT({top: 0, bottom: 5, left: 0, right: 5})
        test2 := RECT({top: 10, bottom: 15, left: 10, right: 15})

        union := test1.Union(test2)

        Assert.IsType(union, RECT)
        Yunit.Assert(union.top == 0)
        Yunit.Assert(union.bottom == 15)
        Yunit.Assert(union.left == 0)
        Yunit.Assert(union.right == 15)
    }

    ; Using the example from the remarks here: https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-subtractrect
    Subtract_WithFullyContainedRect_ReturnsDifference(){
        test1 := RECT({left: 10, top: 10, right: 100, bottom: 100})
        test2 := RECT({left: 50, top: 10, right: 150, bottom: 150})

        diff := test1.Subtract(test2) 

        Assert.IsType(diff, RECT)
        Yunit.Assert(diff.left == 10)
        Yunit.Assert(diff.top == 10)
        Yunit.Assert(diff.right == 50)
        Yunit.Assert(diff.bottom == 100)
    }

    Equals_WithEqualRects_ReturnsTrue(){
        test1 := RECT({left: 10, top: 10, right: 100, bottom: 100})
        test2 := test1.Clone()

        Yunit.Assert(test1.Equals(test2))
    }

    Equals_WithNonEqualRects_ReturnsTrue(){
        test1 := RECT({left: 10, top: 10, right: 100, bottom: 100})
        test2 := RECT({left: 50, top: 10, right: 150, bottom: 150})

        Yunit.Assert(!test1.Equals(test2))
    }

    IsEmpty_WithEmptyRect_ReturnsTrue(){
        empty := RECT()
        empty2 := RECT({left: 10, top: 10, right: 10, bottom: 10})

        Yunit.Assert(empty.isEmpty)
        Yunit.Assert(empty2.isEmpty)
    }

    IsEmpty_WithNonEmptyRect_ReturnsFalse(){
        test1 := RECT({left: 10, top: 10, right: 100, bottom: 100})
        Yunit.Assert(!test1.isEmpty)
    }

    Offset_Always_OffsetsRect(){
        test := RECT({left: 10, top: 10, right: 20, bottom: 20})
        test.Offset(5, 5)

        Yunit.Assert(test.left == 15)
        Yunit.Assert(test.top == 15)
        Yunit.Assert(test.right == 25)
        Yunit.Assert(test.bottom == 25)
    }

    Inflate_Always_InflatesRect(){
        test := RECT({left: 10, top: 10, right: 20, bottom: 20})
        
        test.Inflate(5, 5)

        Yunit.Assert(test.left == 5)
        Yunit.Assert(test.top == 5)
        Yunit.Assert(test.right == 25)
        Yunit.Assert(test.bottom == 25)
    }

    HitTest_WithIntersectingPoint_ReturnsTrue(){
        test := RECT({left: 10, top: 10, right: 20, bottom: 20})
        pt := POINT({x: 15, y: 15})

        Yunit.Assert((val := test.HitTest(pt)), "Got " . val)
    }

    HitTest_WithNonIntersectingPoint_ReturnsFalse(){
        test := RECT({left: 10, top: 10, right: 20, bottom: 20})
        pt := POINT({x: 0, y: 0})

        Yunit.Assert((val := !test.HitTest(pt)), "Got " . val)
    }

    HitTest_WithIntersectingCoords_ReturnsTrue(){
        test := RECT({left: 10, top: 10, right: 20, bottom: 20})

        Yunit.Assert((val := test.HitTest(15, 15)), "Got " . val)
    }

    HitTest_WithNonIntersectingCoords_ReturnsFalse(){
        test := RECT({left: 10, top: 10, right: 20, bottom: 20})

        Yunit.Assert(!(val := test.HitTest(0, 0)), "Got " . val)
    }

    ToString_Always_ReturnsString(){
        test := RECT({left: 10, top: 10, right: 20, bottom: 20})

        expected := "(10, 10) - (20, 20)"
        str := String(test)

        Yunit.Assert(str == expected, Format("Expected '{1}' but got '{2}'", expected, str))
    }
}