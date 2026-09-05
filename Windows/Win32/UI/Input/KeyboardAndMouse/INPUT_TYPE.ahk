#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
class INPUT_TYPE extends Win32Enum {

    /**
     * Native name: INPUT_MOUSE
     * @type {Integer (UInt32)}
     */
    static MOUSE => 0

    /**
     * Native name: INPUT_KEYBOARD
     * @type {Integer (UInt32)}
     */
    static KEYBOARD => 1

    /**
     * Native name: INPUT_HARDWARE
     * @type {Integer (UInt32)}
     */
    static HARDWARE => 2
}
