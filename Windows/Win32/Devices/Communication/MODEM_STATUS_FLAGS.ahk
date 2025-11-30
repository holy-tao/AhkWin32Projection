#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class MODEM_STATUS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MS_CTS_ON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MS_DSR_ON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MS_RING_ON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MS_RLSD_ON => 128
}
