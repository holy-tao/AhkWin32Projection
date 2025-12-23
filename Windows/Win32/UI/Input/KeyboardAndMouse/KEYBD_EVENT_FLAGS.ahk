#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class KEYBD_EVENT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_EXTENDEDKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_KEYUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_SCANCODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_UNICODE => 4
}
