#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct UDCR_TAG {
    #StructPack 8

    bVersion : Int8

    KID : Int8[25]

    ullBaseCounter : Int64

    ullBaseCounterRange : Int64

    fScrambled : BOOL

    bStreamMark : Int8

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}
