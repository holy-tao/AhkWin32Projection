#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_TS_SELECTOR extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_TS_SELECTOR_SETTSID
     * @type {Integer (Int32)}
     */
    static SETTSID => 0

    /**
     * Native name: KSMETHOD_BDA_TS_SELECTOR_GETTSINFORMATION
     * @type {Integer (Int32)}
     */
    static GETTSINFORMATION => 1
}
