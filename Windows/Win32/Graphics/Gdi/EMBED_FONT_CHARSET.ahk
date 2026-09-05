#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class EMBED_FONT_CHARSET extends Win32Enum {

    /**
     * Native name: CHARSET_UNICODE
     * @type {Integer (UInt32)}
     */
    static UNICODE => 1

    /**
     * Native name: CHARSET_SYMBOL
     * @type {Integer (UInt32)}
     */
    static SYMBOL => 2
}
