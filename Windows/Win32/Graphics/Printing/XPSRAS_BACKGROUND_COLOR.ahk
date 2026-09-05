#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class XPSRAS_BACKGROUND_COLOR extends Win32Enum {

    /**
     * Native name: XPSRAS_BACKGROUND_COLOR_TRANSPARENT
     * @type {Integer (Int32)}
     */
    static TRANSPARENT => 0

    /**
     * Native name: XPSRAS_BACKGROUND_COLOR_OPAQUE
     * @type {Integer (Int32)}
     */
    static OPAQUE => 1
}
