#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct RANGECATEGORIZE {
    #StructPack 8

    cRange : UInt32

    aRangeBegin : PROPVARIANT.Ptr

}
