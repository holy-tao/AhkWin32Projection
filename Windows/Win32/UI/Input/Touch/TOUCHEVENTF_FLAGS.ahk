#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class TOUCHEVENTF_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_MOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_UP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_INRANGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_PRIMARY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_NOCOALESCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_PEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_PALM => 128
}
