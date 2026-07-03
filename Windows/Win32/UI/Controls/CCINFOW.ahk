#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CCSTYLEFLAGW.ahk" { CCSTYLEFLAGW }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct CCINFOW {
    #StructPack 8

    szClass : WCHAR[32]

    flOptions : UInt32

    szDesc : WCHAR[32]

    cxDefault : UInt32

    cyDefault : UInt32

    flStyleDefault : UInt32

    flExtStyleDefault : UInt32

    flCtrlTypeMask : UInt32

    cStyleFlags : Int32

    aStyleFlags : CCSTYLEFLAGW.Ptr

    szTextDefault : WCHAR[256]

    lpfnStyle : IntPtr

    lpfnSizeToText : IntPtr

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}
