#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharIteratorCurrent.ahk" { UCharIteratorCurrent }
#Import ".\UCharIteratorGetIndex.ahk" { UCharIteratorGetIndex }
#Import ".\UCharIteratorGetState.ahk" { UCharIteratorGetState }
#Import ".\UCharIteratorHasNext.ahk" { UCharIteratorHasNext }
#Import ".\UCharIteratorHasPrevious.ahk" { UCharIteratorHasPrevious }
#Import ".\UCharIteratorMove.ahk" { UCharIteratorMove }
#Import ".\UCharIteratorNext.ahk" { UCharIteratorNext }
#Import ".\UCharIteratorPrevious.ahk" { UCharIteratorPrevious }
#Import ".\UCharIteratorReserved.ahk" { UCharIteratorReserved }
#Import ".\UCharIteratorSetState.ahk" { UCharIteratorSetState }

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
