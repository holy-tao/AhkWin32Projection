#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Pointer
 */
class TOUCH_FEEDBACK_MODE extends Win32Enum {

    /**
     * Native name: TOUCH_FEEDBACK_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 1

    /**
     * Native name: TOUCH_FEEDBACK_INDIRECT
     * @type {Integer (UInt32)}
     */
    static INDIRECT => 2

    /**
     * Native name: TOUCH_FEEDBACK_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 3
}
