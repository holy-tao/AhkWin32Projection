#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_STREAM_FILTER {
    #StructPack 4

    wPidValue : UInt16

    dwFilterSize : UInt32

    fCrcEnabled : BOOL

    rgchFilter : Int8[16]

    rgchMask : Int8[16]

}
