#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_WST_SERVICE enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_service
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_WST_SERVICE extends Win32Enum {

    /**
     * Reserved.
     * Native name: AM_WST_SERVICE_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Reserved.
     * Native name: AM_WST_SERVICE_Text
     * @type {Integer (Int32)}
     */
    static Text => 1

    /**
     * Reserved.
     * Native name: AM_WST_SERVICE_IDS
     * @type {Integer (Int32)}
     */
    static IDS => 2

    /**
     * Reserved.
     * Native name: AM_WST_SERVICE_Invalid
     * @type {Integer (Int32)}
     */
    static Invalid => 3
}
