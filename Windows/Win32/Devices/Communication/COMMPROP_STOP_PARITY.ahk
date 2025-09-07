#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class COMMPROP_STOP_PARITY{

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
     * @type {Integer (UInt16)}
     */
    static PARITY_NONE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_ODD => 512

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_EVEN => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_MARK => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_SPACE => 4096
}
