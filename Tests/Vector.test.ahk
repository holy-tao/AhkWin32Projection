#Requires AutoHotkey >=v2.1-alpha.30

#Import "./Yunit/Yunit.ahk" { Yunit }
#Import "./YunitExtensions/Assert.ahk" { Assert }

#Import "../Vector.ahk" { Vector }
#Import "../Windows/Win32/Foundation/RECT.ahk" { RECT }

/**
 * A small struct with a `__value`, used to exercise the value-coercion code paths (the getter/setter
 * may return/accept anything; Vector must not assume a scalar).
 */
struct ValueChar {
    val: Int8

    __value {
        get => Chr(this.val)
        set => this.val := value is String ? Ord(value) : value
    }
}

mkRect(top) {
    r := RECT()
    r.top := top
    return r
}

class VectorTests {

    class Construction {
        Constructor_WithStruct_Works() {
            vec := Vector(RECT, RECT())

            Assert.Equals(vec.length, 1)
            Yunit.Assert(vec.Get(1) is RECT)
        }

        Constructor_WithNumeric_Works() {
            vec := Vector(Int64, 42)

            Assert.Equals(vec.length, 1)
            Yunit.Assert(IsInteger(vec.Get(1)))
        }

        Constructor_WithNoValues_IsEmpty() {
            vec := Vector(Int64)

            Assert.Equals(vec.length, 0)
            Yunit.Assert(vec.capacity >= 1, "Empty vector should still have backing capacity")
        }

        Constructor_WithNonStructType_ThrowsTypeError() {
            Assert.Throws((*) => Vector(Array), TypeError)     ; a class, but not a Struct
            Assert.Throws((*) => Vector("string"), TypeError)
            Assert.Throws((*) => Vector({}), TypeError)
        }
    }

    class TypeIdentity {
        Of_SameType_ReturnsCachedClass() {
            Yunit.Assert(Vector.Of(Int64) == Vector.Of(Int64), "Vector.Of must cache per element type")
        }

        Of_DifferentTypes_ReturnsDistinctClasses() {
            Yunit.Assert(Vector.Of(Int64) != Vector.Of(Int32))
        }

        Constructor_ProducesInstanceOfTypedClass() {
            vec := Vector(Int64, 1, 2, 3)

            Yunit.Assert(vec is Vector, "A typed vector is still a Vector")
            Yunit.Assert(vec is Vector.Of(Int64), "Vector(T, ...) must be an instance of Vector.Of(T)")
        }

        TypedClass_DistinguishesElementType() {
            vec := Vector(Int64, 1)

            Yunit.Assert(!(vec is Vector.Of(Int32)), "A Vector<Int64> is not a Vector<Int32>")
        }

        ElementType_ReportsElementType() {
            Assert.Equals(Vector(RECT).ElementType, RECT)
        }
    }

    class Enumeration {
        EnumeratorOne_WithNumeric_EnumeratesEverything() {
            vec := Vector(Int64, 1, 2, 3, 4, 5)

            for val in vec
                Yunit.Assert(val == A_Index, Format("Expected {1}, but got {2}", A_Index, val))
        }

        EnumeratorTwo_WithNumeric_EnumeratesEverything() {
            vec := Vector(Int64, 1, 2, 3, 4, 5)

            for index, val in vec {
                Yunit.Assert(index == A_Index, Format("2-var enumerator returned {1} for index {2}", index, A_Index))
                Yunit.Assert(val == index, Format("Expected {1}, but got {2}", index, val))
            }
        }

        EnumeratorOne_WithStruct_EnumeratesEverything() {
            vec := Vector(RECT, mkRect(1), mkRect(2), mkRect(3), mkRect(4), mkRect(5))

            for val in vec {
                Yunit.Assert(val is RECT, "Expected a RECT but got a(n) " Type(val))
                Yunit.Assert(val.top == A_Index, Format("Expected {1}, but got {2}", A_Index, val.top))
            }
        }

        EnumeratorTwo_WithStruct_EnumeratesEverything() {
            vec := Vector(RECT, mkRect(1), mkRect(2), mkRect(3), mkRect(4), mkRect(5))

            for index, val in vec {
                Yunit.Assert(index == A_Index, Format("2-var enumerator returned {1} for index {2}", index, A_Index))
                Yunit.Assert(val.top == index, Format("Expected {1}, but got {2}", index, val.top))
            }
        }
    }

    class PushPop {
        Push_PushesValue() {
            vec := Vector(RECT)
            vec.Push(mkRect(1))
            vec.Push(mkRect(2))

            Assert.Equals(vec[1].top, 1)
            Assert.Equals(vec[2].top, 2)
            Assert.Equals(vec.length, 2)
        }

        Push_WithMultipleArguments_PushesAll() {
            vec := Vector(RECT)
            vec.Push(mkRect(1), mkRect(2), mkRect(3))

            Assert.Equals(vec[1].top, 1)
            Assert.Equals(vec[2].top, 2)
            Assert.Equals(vec[3].top, 3)
            Assert.Equals(vec.length, 3)
        }

        Pop_PopsLastValue() {
            vec := Vector(Int64, 1, 2, 3, 4, 5)

            Assert.Equals(vec.Pop(), 5)
            Assert.Equals(vec.length, 4)
        }

        Pop_WithStruct_PopsLastValue() {
            vec := Vector(RECT, mkRect(1), mkRect(2))

            last := vec.Pop()
            Assert.Equals(last.top, 2)
            Assert.Equals(vec.length, 1)
        }

        Pop_OnEmptyVector_Throws() {
            Assert.Throws((*) => Vector(Int64).Pop(), Error)
        }
    }

    class InsertRemove {
        InsertAt_WithStruct_ShiftsValuesRight() {
            vec := Vector(RECT, mkRect(1), mkRect(2), mkRect(3), mkRect(4), mkRect(5))

            vec.InsertAt(2, mkRect(100))

            Assert.Equals(vec[2].top, 100)
            Assert.Equals(vec[3].top, 2)
            Assert.Equals(vec[4].top, 3)
            Assert.Equals(vec[5].top, 4)
            Assert.Equals(vec[6].top, 5)
            Assert.Equals(vec.length, 6)
        }

        InsertAt_WithNumeric_ShiftsValuesRight() {
            vec := Vector(Int64, 1, 2, 3, 4, 5)

            vec.InsertAt(2, 100)

            Assert.Equals(vec[1], 1)
            Assert.Equals(vec[2], 100)
            Assert.Equals(vec[3], 2)
            Assert.Equals(vec[6], 5)
            Assert.Equals(vec.length, 6)
        }

        InsertAt_WithMultipleValues_InsertsAllInOrder() {
            vec := Vector(Int64, 10, 20)

            vec.InsertAt(1, 7, 8, 9)

            Assert.Equals(vec[1], 7)
            Assert.Equals(vec[2], 8)
            Assert.Equals(vec[3], 9)
            Assert.Equals(vec[4], 10)
            Assert.Equals(vec[5], 20)
        }

        InsertAt_AtOnePastEnd_Appends() {
            vec := Vector(Int64, 1, 2, 3)

            vec.InsertAt(vec.length + 1, 4)

            Assert.Equals(vec[4], 4)
            Assert.Equals(vec.length, 4)
        }

        RemoveAt_WithStruct_ShiftsValuesLeft() {
            vec := Vector(RECT, mkRect(1), mkRect(2), mkRect(3), mkRect(4), mkRect(5))

            removed := vec.RemoveAt(2)

            Assert.Equals(removed.top, 2)
            Assert.Equals(vec[1].top, 1)
            Assert.Equals(vec[2].top, 3)
            Assert.Equals(vec[3].top, 4)
            Assert.Equals(vec[4].top, 5)
            Assert.Equals(vec.length, 4)
        }

        RemoveAt_WithNumeric_ShiftsValuesLeft() {
            vec := Vector(Int64, 1, 2, 3, 4, 5)

            removed := vec.RemoveAt(2)

            Assert.Equals(removed, 2)
            Assert.Equals(vec[1], 1)
            Assert.Equals(vec[2], 3)
            Assert.Equals(vec[4], 5)
            Assert.Equals(vec.length, 4)
        }
    }

    class NegativeIndexing {
        Get_WithNegativeIndex_CountsFromEnd() {
            vec := Vector(Int64, 10, 20, 30, 40)

            Assert.Equals(vec[-1], 40)
            Assert.Equals(vec[-4], 10)
        }

        Set_WithNegativeIndex_CountsFromEnd() {
            vec := Vector(Int64, 10, 20, 30, 40)

            vec[-2] := 99
            Assert.Equals(vec[3], 99)
        }

        RemoveAt_WithNegativeIndex_RemovesFromEnd() {
            vec := Vector(Int64, 10, 20, 30, 40)

            Assert.Equals(vec.RemoveAt(-1), 40)
            Assert.Equals(vec.length, 3)
        }

        InsertAt_WithNegativeIndex_InsertsBeforeElement() {
            vec := Vector(Int64, 10, 20, 30)

            vec.InsertAt(-1, 99)        ; insert before the last element

            Assert.Equals(vec[3], 99)
            Assert.Equals(vec[4], 30)
        }

        Has_WithNegativeIndex_ChecksFromEnd() {
            vec := Vector(Int64, 1, 2, 3)

            Yunit.Assert(vec.Has(-3), "Has(-3) on length 3 should be true")
            Yunit.Assert(!vec.Has(-4), "Has(-4) on length 3 should be false")
        }

        OutOfRangeIndex_ThrowsIndexError() {
            vec := Vector(Int64, 1, 2, 3)

            Assert.Throws((*) => vec[4], IndexError)
            Assert.Throws((*) => vec[-4], IndexError)
            Assert.Throws((*) => vec[0], IndexError)
        }
    }

    class ItemAccess {
        SetComposite_ThroughItem_DoesNotThrow() {
            ; Regression: __Item's setter delegates to Set, whose memcpy branch returns no value.
            ; A fat-arrow setter would surface that as "No value was returned".
            vec := Vector(RECT, mkRect(1), mkRect(2))

            vec[1] := mkRect(5)
            Assert.Equals(vec[1].top, 5)

            vec[-1] := mkRect(7)
            Assert.Equals(vec[2].top, 7)
        }

        Set_WithWrongMemberType_ThrowsTypeError() {
            Assert.Throws((*) => Vector(RECT).Push(42), TypeError)
        }
    }

    class MemorySemantics {
        RemoveAt_WithStruct_ReturnsIndependentCopy() {
            vec := Vector(RECT, mkRect(5), mkRect(6), mkRect(7))

            removed := vec.RemoveAt(2)
            vec[2].top := 999           ; clobber the slot region the removed value occupied

            Yunit.Assert(removed.top == 6, "RemoveAt must return an owned copy, not a view")
        }

        Pop_WithStruct_ReturnsCopyThatSurvivesSlotReuse() {
            vec := Vector(RECT, mkRect(8))

            top := vec.Pop()
            vec.Push(mkRect(9))         ; reuse the freed slot

            Yunit.Assert(top.top == 8, "Pop must return an owned copy, not a view into the freed slot")
        }
    }

    class Resizing {
        Push_BeyondCapacity_GrowsCapacity() {
            vec := Vector(Int64)
            loop 50
                vec.Push(A_Index)

            Assert.Equals(vec.length, 50)
            Yunit.Assert(vec.capacity >= 50, "Capacity should grow to fit 50 elements")
            Assert.Equals(vec[50], 50)
        }

        ShrinkToFit_SetsCapacityToLength() {
            vec := Vector(Int64, 1, 2, 3)
            vec.ShrinkToFit()

            Assert.Equals(vec.capacity, vec.length)
        }
    }

    ToString_WithNumerics_ReturnsTypedString() {
        vec := Vector(Int64, 1, 2, 3)
        Assert.Equals(String(vec), "Vector<Int64>[1, 2, 3]")
    }

    ToString_WithValueStrings_QuotesElements() {
        vec := Vector(ValueChar, "a", "b", "c")
        Assert.Equals(String(vec), 'Vector<ValueChar>["a", "b", "c"]')
    }
}
