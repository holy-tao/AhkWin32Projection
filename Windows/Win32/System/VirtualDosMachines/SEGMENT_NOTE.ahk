#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct SEGMENT_NOTE {
    #StructPack 4

    Selector1 : UInt16

    Selector2 : UInt16

    Segment : UInt16

    Module : CHAR[10]

    FileName : CHAR[256]

    Type : UInt16

    Length : UInt32

}
