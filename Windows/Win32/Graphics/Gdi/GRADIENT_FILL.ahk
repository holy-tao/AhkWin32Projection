#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GRADIENT_FILL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_RECT_H => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_RECT_V => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_TRIANGLE => 2
}
