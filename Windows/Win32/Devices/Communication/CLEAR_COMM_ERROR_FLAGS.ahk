#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class CLEAR_COMM_ERROR_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CE_BREAK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CE_FRAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CE_OVERRUN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CE_RXOVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CE_RXPARITY => 4
}
