#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
class SERENUM_PORTION extends Win32Enum {

    /**
     * Native name: SerenumFirstHalf
     * @type {Integer (Int32)}
     */
    static FirstHalf => 0

    /**
     * Native name: SerenumSecondHalf
     * @type {Integer (Int32)}
     */
    static SecondHalf => 1

    /**
     * Native name: SerenumWhole
     * @type {Integer (Int32)}
     */
    static Whole => 2
}
