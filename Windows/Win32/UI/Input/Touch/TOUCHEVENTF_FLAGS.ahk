#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Touch
 */
class TOUCHEVENTF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: TOUCHEVENTF_MOVE
     * @type {Integer (UInt32)}
     */
    static MOVE => 1

    /**
     * Native name: TOUCHEVENTF_DOWN
     * @type {Integer (UInt32)}
     */
    static DOWN => 2

    /**
     * Native name: TOUCHEVENTF_UP
     * @type {Integer (UInt32)}
     */
    static UP => 4

    /**
     * Native name: TOUCHEVENTF_INRANGE
     * @type {Integer (UInt32)}
     */
    static INRANGE => 8

    /**
     * Native name: TOUCHEVENTF_PRIMARY
     * @type {Integer (UInt32)}
     */
    static PRIMARY => 16

    /**
     * Native name: TOUCHEVENTF_NOCOALESCE
     * @type {Integer (UInt32)}
     */
    static NOCOALESCE => 32

    /**
     * Native name: TOUCHEVENTF_PEN
     * @type {Integer (UInt32)}
     */
    static PEN => 64

    /**
     * Native name: TOUCHEVENTF_PALM
     * @type {Integer (UInt32)}
     */
    static PALM => 128
}
