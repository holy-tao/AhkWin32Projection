#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_WST_STYLE enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_style
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_WST_STYLE extends Win32Enum {

    /**
     * Reserved.
     * Native name: AM_WST_STYLE_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Reserved.
     * Native name: AM_WST_STYLE_Invers
     * @type {Integer (Int32)}
     */
    static Invers => 1
}
