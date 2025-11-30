#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class COMM_EVENT_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static EV_BREAK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EV_CTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EV_DSR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EV_ERR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EV_EVENT1 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static EV_EVENT2 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static EV_PERR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EV_RING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EV_RLSD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EV_RX80FULL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static EV_RXCHAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EV_RXFLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EV_TXEMPTY => 4
}
