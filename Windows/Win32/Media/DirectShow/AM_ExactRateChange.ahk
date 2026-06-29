#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_ExactRateChange structure is not supported. Use AM_SimpleRateChange.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_exactratechange
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_ExactRateChange {
    #StructPack 8

    /**
     * Reserved.
     */
    OutputZeroTime : Int64

    /**
     * Reserved.
     */
    Rate : Int32

}
