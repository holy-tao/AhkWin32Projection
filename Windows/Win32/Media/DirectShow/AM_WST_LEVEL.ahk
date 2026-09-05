#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_WST_LEVEL enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_level
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_WST_LEVEL extends Win32Enum {

    /**
     * Not implemented.
     * Native name: AM_WST_LEVEL_1_5
     * @type {Integer (Int32)}
     */
    static 1_5 => 0
}
