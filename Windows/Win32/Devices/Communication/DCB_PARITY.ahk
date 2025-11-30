#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class DCB_PARITY extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static EVENPARITY => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static MARKPARITY => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static NOPARITY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static ODDPARITY => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static SPACEPARITY => 0x04
}
