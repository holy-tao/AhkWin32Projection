#Requires AutoHotkey v2.0

#Include ../CStyleArray.ahk
#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk
#Include ../Windows/Win32/Foundation/RECT.ahk

class CStyleArrayListTests {

    Constructor_WithStruct_Works(){
        list := CStyleArrayList(RECT, 1)

        Yunit.Assert(list.length == 1)
        Yunit.Assert(list.Get(1) is RECT)
    }

    Constructor_WithPrimitive_Works(){
        list := CStyleArrayList(Primitive, "Int", 1)

        Yunit.Assert(list.length == 1)
        Yunit.Assert(IsInteger(list.Get(1)))
    }

    Constructor_WithInvalidPrimitiveType_ThrowsTypeError(){
        Assert.Throws((*) => CStyleArrayList(Primitive, "NotAValidType"), TypeError)
        Assert.Throws((*) => CStyleArrayList(Primitive, 1), TypeError)
    }

    Constructor_WithInvalidStructType_ThrowsTypeError(){
        Assert.Throws((*) => CStyleArrayList({}, 3), TypeError)
        Assert.Throws((*) => CStyleArrayList("string", 3), TypeError)
    }

    EnumeratorOne_WithPrimitive_EnumeratesEverything(){
        list := CStyleArrayList(Primitive, "Int64", 5)
        list[1] := 1
        list[2] := 2
        list[3] := 3
        list[4] := 4
        list[5] := 5

        for(val in list){
            Yunit.Assert(val == A_Index, Format("Expected {1}, but got {2}", A_Index, val))
        }
    }

    EnumeratorTwo_WithPrimitive_EnumeratesEverything(){
        list := CStyleArrayList(Primitive, "Int64", 5)
        list[1] := 1
        list[2] := 2
        list[3] := 3
        list[4] := 4
        list[5] := 5

        for(index, val in list){
            Yunit.Assert(index == A_Index, Format("2-Parameter enumerator returned {1} for index {2}", index, A_Index))
            Yunit.Assert(val == index, Format("Expected {1}, but got {2}", index, val))
        }
    }

    EnumeratorOne_WithStruct_EnumeratesEverything(){
        list := CStyleArrayList(RECT, 5)
        list[1] := RECT.FromObject({top: 1})
        list[2] := RECT.FromObject({top: 2})
        list[3] := RECT.FromObject({top: 3})
        list[4] := RECT.FromObject({top: 4})
        list[5] := RECT.FromObject({top: 5})

        for(val in list){
            Yunit.Assert(val is RECT, "Expected a RECT but got a(n) " . Type(val))
            Yunit.Assert(val.top == A_Index, Format("Expected {1}, but got {2}", A_Index, val.top))
        }
    }

    EnumeratorTwo_WithStruct_EnumeratesEverything(){
        list := CStyleArrayList(RECT, 5)
        list[1] := RECT.FromObject({top: 1})
        list[2] := RECT.FromObject({top: 2})
        list[3] := RECT.FromObject({top: 3})
        list[4] := RECT.FromObject({top: 4})
        list[5] := RECT.FromObject({top: 5})

        for(index, val in list){
            Yunit.Assert(index == A_Index, Format("2-Parameter enumerator returned {1} for index {2}", index, A_Index))
            Yunit.Assert(val is RECT, "Expected a RECT but got a(n) " . Type(val))
            Yunit.Assert(val.top == index, Format("Expected {1}, but got {2}", index, val.top))
        }
    }

    InsertAt_WithOneParam_ShiftsValuesRight(){
        list := CStyleArrayList(RECT, 5)
        list[1] := RECT.FromObject({top: 1})
        list[2] := RECT.FromObject({top: 2})
        list[3] := RECT.FromObject({top: 3})
        list[4] := RECT.FromObject({top: 4})
        list[5] := RECT.FromObject({top: 5})

        list.InsertAt(2, RECT.FromObject({top: 100, bottom: 100}))

        Yunit.Assert(list[2].MemoryEquals(RECT.FromObject({top: 100, bottom: 100})), list[2].HexDump())
        Yunit.Assert(list[3].top == 2)
        Yunit.Assert(list[4].top == 3)
        Yunit.Assert(list[5].top == 4)
        Yunit.Assert(list[6].top == 5)
    }

    ToString_WithPrimitives_ReturnsUsefulString(){
        list := CStyleArrayList(Primitive, "Int64", 5)
        list[1] := 1
        list[2] := 2
        list[3] := 3
        list[4] := 4
        list[5] := 5

        expected := "[1, 2, 3, 4, 5]"
        Yunit.Assert(String(list) == expected, Format("Got '{1}' but expected '{2}'", String(list), expected))
    }
}
