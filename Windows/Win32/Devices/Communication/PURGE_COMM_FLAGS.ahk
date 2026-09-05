#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 */
class PURGE_COMM_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PURGE_RXABORT
     * @type {Integer (UInt32)}
     */
    static RXABORT => 2

    /**
     * Native name: PURGE_RXCLEAR
     * @type {Integer (UInt32)}
     */
    static RXCLEAR => 8

    /**
     * Native name: PURGE_TXABORT
     * @type {Integer (UInt32)}
     */
    static TXABORT => 1

    /**
     * Native name: PURGE_TXCLEAR
     * @type {Integer (UInt32)}
     */
    static TXCLEAR => 4
}
