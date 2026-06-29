#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INVOC.ahk" { INVOC }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct UNIDRVINFO {
    #StructPack 4

    dwSize : UInt32

    flGenFlags : UInt32

    wType : UInt16

    fCaps : UInt16

    wXRes : UInt16

    wYRes : UInt16

    sYAdjust : Int16

    sYMoved : Int16

    wPrivateData : UInt16

    sShift : Int16

    SelectFont : INVOC

    UnSelectFont : INVOC

    wReserved : UInt16[4]

}
