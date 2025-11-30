#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class PURGE_COMM_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_RXABORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_RXCLEAR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_TXABORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_TXCLEAR => 4
}
