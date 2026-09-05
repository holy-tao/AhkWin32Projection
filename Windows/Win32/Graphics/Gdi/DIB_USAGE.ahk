#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class DIB_USAGE extends Win32Enum {

    /**
     * Native name: DIB_RGB_COLORS
     * @type {Integer (UInt32)}
     */
    static RGB_COLORS => 0

    /**
     * Native name: DIB_PAL_COLORS
     * @type {Integer (UInt32)}
     */
    static PAL_COLORS => 1
}
