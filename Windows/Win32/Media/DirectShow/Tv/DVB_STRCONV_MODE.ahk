#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DVB_STRCONV_MODE extends Win32Enum {

    /**
     * Native name: STRCONV_MODE_DVB
     * @type {Integer (Int32)}
     */
    static DVB => 0

    /**
     * Native name: STRCONV_MODE_DVB_EMPHASIS
     * @type {Integer (Int32)}
     */
    static DVB_EMPHASIS => 1

    /**
     * Native name: STRCONV_MODE_DVB_WITHOUT_EMPHASIS
     * @type {Integer (Int32)}
     */
    static DVB_WITHOUT_EMPHASIS => 2

    /**
     * Native name: STRCONV_MODE_ISDB
     * @type {Integer (Int32)}
     */
    static ISDB => 3
}
