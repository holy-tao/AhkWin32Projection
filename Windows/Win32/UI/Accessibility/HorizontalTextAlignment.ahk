#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
class HorizontalTextAlignment extends Win32Enum {

    /**
     * Native name: HorizontalTextAlignment_Left
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * Native name: HorizontalTextAlignment_Centered
     * @type {Integer (Int32)}
     */
    static Centered => 1

    /**
     * Native name: HorizontalTextAlignment_Right
     * @type {Integer (Int32)}
     */
    static Right => 2

    /**
     * Native name: HorizontalTextAlignment_Justified
     * @type {Integer (Int32)}
     */
    static Justified => 3
}
