#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class POINTER_INPUT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PT_POINTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PT_TOUCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static PT_PEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static PT_MOUSE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PT_TOUCHPAD => 5
}
