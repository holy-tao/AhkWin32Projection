#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class XPSRAS_BACKGROUND_COLOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_BACKGROUND_COLOR_TRANSPARENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_BACKGROUND_COLOR_OPAQUE => 1
}
