#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_MUX_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_MUX_GETPIDLIST
     * @type {Integer (Int32)}
     */
    static GETPIDLIST => 0

    /**
     * Native name: KSMETHOD_BDA_MUX_SETPIDLIST
     * @type {Integer (Int32)}
     */
    static SETPIDLIST => 1
}
