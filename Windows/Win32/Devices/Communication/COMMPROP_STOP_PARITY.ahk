#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 */
class COMMPROP_STOP_PARITY extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt16)}
     */
    static STOPBITS_10 => 1

    /**
     * @type {Integer (UInt16)}
     */
    static STOPBITS_15 => 2

    /**
     * @type {Integer (UInt16)}
     */
    static STOPBITS_20 => 4

    /**
     * Native name: PARITY_NONE
     * @type {Integer (UInt16)}
     */
    static NONE => 256

    /**
     * Native name: PARITY_ODD
     * @type {Integer (UInt16)}
     */
    static ODD => 512

    /**
     * Native name: PARITY_EVEN
     * @type {Integer (UInt16)}
     */
    static EVEN => 1024

    /**
     * Native name: PARITY_MARK
     * @type {Integer (UInt16)}
     */
    static MARK => 2048

    /**
     * Native name: PARITY_SPACE
     * @type {Integer (UInt16)}
     */
    static SPACE => 4096
}
