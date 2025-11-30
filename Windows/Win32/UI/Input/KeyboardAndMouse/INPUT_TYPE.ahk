#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class INPUT_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static INPUT_MOUSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INPUT_KEYBOARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INPUT_HARDWARE => 2
}
