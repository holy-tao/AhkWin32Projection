#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class GRADIENT_FILL extends Win32Enum {

    /**
     * Native name: GRADIENT_FILL_RECT_H
     * @type {Integer (UInt32)}
     */
    static RECT_H => 0

    /**
     * Native name: GRADIENT_FILL_RECT_V
     * @type {Integer (UInt32)}
     */
    static RECT_V => 1

    /**
     * Native name: GRADIENT_FILL_TRIANGLE
     * @type {Integer (UInt32)}
     */
    static TRIANGLE => 2
}
