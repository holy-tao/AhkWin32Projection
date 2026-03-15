#Requires AutoHotkey v2.0

#Include ../Win32FixedArray.ahk
#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk
#Include ../Windows/Win32/Foundation/RECT.ahk

class CStyleArrayListTests {

    class Construction {
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

        Constructor_DllCallType_IsCaseInsensitive(){
            list := CStyleArrayList(Primitive, "Int", 1)
            list := CStyleArrayList(Primitive, "int", 1)
            list := CStyleArrayList(Primitive, "INT", 1)
        }

        Constructor_WithInvalidPrimitiveType_ThrowsTypeError(){
            Assert.Throws((*) => CStyleArrayList(Primitive, "NotAValidType"), TypeError)
            Assert.Throws((*) => CStyleArrayList(Primitive, 1), TypeError)
        }

        Constructor_WithInvalidStructType_ThrowsTypeError(){
            Assert.Throws((*) => CStyleArrayList({}, 3), TypeError)
            Assert.Throws((*) => CStyleArrayList("string", 3), TypeError)
        }
    }

    class Enumeration {
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
    }

    class InsertRemove {
        InsertAt_WithStructArray_ShiftsValuesRight(){
            list := CStyleArrayList(RECT, 5)
            list[1] := RECT.FromObject({top: 1})
            list[2] := RECT.FromObject({top: 2})
            list[3] := RECT.FromObject({top: 3})
            list[4] := RECT.FromObject({top: 4})
            list[5] := RECT.FromObject({top: 5})

            list.InsertAt(2, RECT.FromObject({top: 100, bottom: 100}))

            Yunit.Assert(list[2].MemoryEquals(RECT({top: 100, bottom: 100})), list[2].HexDump())
            Yunit.Assert(list[3].top == 2)
            Yunit.Assert(list[4].top == 3)
            Yunit.Assert(list[5].top == 4)
            Yunit.Assert(list[6].top == 5)
        }

        InsertAt_WithPrimitiveArray_ShiftsValuesRight(){
            list := CStyleArrayList(Primitive, "uint", 5)
            loop(list.length)
                list[A_Index] := A_Index

            list.InsertAt(2, 100)

            Assert.Equals(list[2], 100)

            Assert.Equals(list[1], 1)
            Assert.Equals(list[3], 2)
            Assert.Equals(list[4], 3)
            Assert.Equals(list[5], 4)
            Assert.Equals(list[6], 5)
            Assert.Equals(list.length, 6)
        }

        RemoveAt_WithStructArray_ShiftsValuesRight(){
            list := CStyleArrayList(RECT, 5)
            list[1] := RECT.FromObject({top: 1})
            list[2] := RECT.FromObject({top: 2})
            list[3] := RECT.FromObject({top: 3})
            list[4] := RECT.FromObject({top: 4})
            list[5] := RECT.FromObject({top: 5})

            removed := list.RemoveAt(2)

            Assert.Equals(removed.top, 2)
            Yunit.Assert(list[1].top == 1)
            Yunit.Assert(list[2].top == 3)
            Yunit.Assert(list[3].top == 4)
            Yunit.Assert(list[4].top == 5)
            Assert.Equals(list.length, 4)
        }

        RemoveAt_WithPrimitiveArray_ShiftsValuesRight(){
            list := CStyleArrayList(Primitive, "uint", 5)
            loop(list.length)
                list[A_Index] := A_Index

            removed := list.RemoveAt(2)

            Assert.Equals(removed, 2)
            Assert.Equals(list[1], 1)
            Assert.Equals(list[2], 3)
            Assert.Equals(list[3], 4)
            Assert.Equals(list[4], 5)
            Assert.Equals(list.length, 4)
        }
    }

    class PushPop {
        Push_PushesValue() {
            list := CStyleArrayList(RECT, 0)
            list.Push(RECT({top: 1, bottom: 0xFF}))
            list.Push(RECT({top: 2}))

            Assert.Equals(list[1].top, 1)
            Assert.Equals(list[2].top, 2)
            Assert.Equals(list.length, 2)
        }

        Push_WithMultipleArguments_PushesValue() {
            list := CStyleArrayList(RECT, 0)
            list.Push(RECT({top: 1}), RECT({top: 2}), RECT({top: 3}))

            Assert.Equals(list[1].top, 1)
            Assert.Equals(list[2].top, 2)
            Assert.Equals(list[3].top, 3)
            Assert.Equals(list.length, 3)
        }

        Pop_PopsLastValue() {
            list := CStyleArrayList(RECT, 5)
            list[1] := RECT.FromObject({top: 1})
            list[2] := RECT.FromObject({top: 2})
            list[3] := RECT.FromObject({top: 3})
            list[4] := RECT.FromObject({top: 4})
            list[5] := RECT.FromObject({top: 5})

            last := list.Pop()
            
            Assert.Equals(last.top, 5)
            Assert.Equals(list.length, 4)
        }
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

class Win32FixedArrayTests {

    Constructor_WithPrimitive_Works(){
        buf := Buffer(20, 0)
        arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")

        Yunit.Assert(arr.length == 5)
        Yunit.Assert(arr.ptr == buf.ptr)
    }

    Inheritance_IsCStyleArrayList(){
        buf := Buffer(20, 0)
        arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")

        Yunit.Assert(arr is CStyleArrayList, "Win32FixedArray should be a CStyleArrayList")
        Yunit.Assert(arr is Win32Struct, "Win32FixedArray should be a Win32Struct")
    }

    GetSet_WithPrimitive_Works(){
        buf := Buffer(20, 0)
        arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")

        arr[1] := 42
        arr[3] := 99

        Yunit.Assert(arr[1] == 42, Format("Expected 42, but got {1}", arr[1]))
        Yunit.Assert(arr[3] == 99, Format("Expected 99, but got {1}", arr[3]))
    }

    GetSet_WithStruct_Works(){
        buf := Buffer(RECT.sizeof * 3, 0)
        arr := Win32FixedArray(buf.ptr, 3, RECT)

        arr[1] := RECT.FromObject({top: 10, bottom: 20})
        arr[2] := RECT.FromObject({top: 30, bottom: 40})

        Yunit.Assert(arr[1].top == 10, Format("Expected 10, but got {1}", arr[1].top))
        Yunit.Assert(arr[2].bottom == 40, Format("Expected 40, but got {1}", arr[2].bottom))
    }

    class Enumeration {
        EnumeratorOne_WithPrimitive_EnumeratesEverything(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            arr[1] := 1
            arr[2] := 2
            arr[3] := 3
            arr[4] := 4
            arr[5] := 5

            for(val in arr){
                Yunit.Assert(val == A_Index, Format("Expected {1}, but got {2}", A_Index, val))
            }
        }

        EnumeratorTwo_WithPrimitive_EnumeratesEverything(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            arr[1] := 1
            arr[2] := 2
            arr[3] := 3
            arr[4] := 4
            arr[5] := 5

            for(index, val in arr){
                Yunit.Assert(index == A_Index, Format("2-Parameter enumerator returned {1} for index {2}", index, A_Index))
                Yunit.Assert(val == index, Format("Expected {1}, but got {2}", index, val))
            }
        }
    }

    class Immutability {
        Push_Always_ThrowsMethodError(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            Assert.Throws((*) => arr.Push(1), MethodError)
        }

        Pop_Always_ThrowsMethodError(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            Assert.Throws((*) => arr.Pop(), MethodError)
        }

        InsertAt_Always_ThrowsMethodError(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            Assert.Throws((*) => arr.InsertAt(1, 42), MethodError)
        }

        RemoveAt_Always_ThrowsMethodError(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            Assert.Throws((*) => arr.RemoveAt(1), MethodError)
        }

        LengthSet_AfterConstruction_ThrowsPropertyError(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            Assert.Throws((*) => arr.length := 10, PropertyError)
        }

        Owned_Always_ReturnsFalse(){
            buf := Buffer(20, 0)
            arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
            Yunit.Assert(arr._owned == false, "FixedArray should not be owned")
        }
    }

    Has_WithValidIndex_ReturnsTrue(){
        buf := Buffer(20, 0)
        arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
        Yunit.Assert(arr.Has(1), "Has(1) should return true")
        Yunit.Assert(arr.Has(5), "Has(5) should return true")
    }

    Has_WithInvalidIndex_ReturnsFalse() {
        buf := Buffer(20, 0)
        arr := Win32FixedArray(buf.ptr, 5, Primitive, "Int")
        Yunit.Assert(!arr.Has(0), "Has(0) should return false")
        Yunit.Assert(!arr.Has(6), "Has(6) should return false")
    }
}
