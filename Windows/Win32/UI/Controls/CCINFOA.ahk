#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CCSTYLEFLAGA.ahk" { CCSTYLEFLAGA }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct CCINFOA {
    #StructPack 8

    szClass : CHAR[32]

    flOptions : UInt32

    szDesc : CHAR[32]

    cxDefault : UInt32

    cyDefault : UInt32

    flStyleDefault : UInt32

    flExtStyleDefault : UInt32

    flCtrlTypeMask : UInt32

    szTextDefault : CHAR[256]

    cStyleFlags : Int32

    aStyleFlags : CCSTYLEFLAGA.Ptr

    lpfnStyle : IntPtr

    lpfnSizeToText : IntPtr

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}
