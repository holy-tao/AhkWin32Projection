#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharIteratorHasPrevious.ahk" { UCharIteratorHasPrevious }
#Import ".\UCharIteratorNext.ahk" { UCharIteratorNext }
#Import ".\UCharIteratorGetState.ahk" { UCharIteratorGetState }
#Import ".\UCharIteratorMove.ahk" { UCharIteratorMove }
#Import ".\UCharIteratorSetState.ahk" { UCharIteratorSetState }
#Import ".\UCharIteratorPrevious.ahk" { UCharIteratorPrevious }
#Import ".\UCharIteratorGetIndex.ahk" { UCharIteratorGetIndex }
#Import ".\UCharIteratorReserved.ahk" { UCharIteratorReserved }
#Import ".\UCharIteratorCurrent.ahk" { UCharIteratorCurrent }
#Import ".\UCharIteratorHasNext.ahk" { UCharIteratorHasNext }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharIterator {
    #StructPack 8

    context : IntPtr

    length : Int32

    start : Int32

    index : Int32

    limit : Int32

    reservedField : Int32

    getIndex : UCharIteratorGetIndex

    move : UCharIteratorMove

    hasNext : UCharIteratorHasNext

    hasPrevious : UCharIteratorHasPrevious

    current : UCharIteratorCurrent

    next : UCharIteratorNext

    previous : UCharIteratorPrevious

    reservedFn : UCharIteratorReserved

    getState : UCharIteratorGetState

    setState : UCharIteratorSetState

}
