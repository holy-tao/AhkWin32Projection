#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 * @version v4.0.30319
 */
class SERENUM_PORTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SerenumFirstHalf => 0

    /**
     * @type {Integer (Int32)}
     */
    static SerenumSecondHalf => 1

    /**
     * @type {Integer (Int32)}
     */
    static SerenumWhole => 2
}
