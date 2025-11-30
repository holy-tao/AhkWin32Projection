#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class DCB_STOP_BITS extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static ONESTOPBIT => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static ONE5STOPBITS => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static TWOSTOPBITS => 0x02
}
