#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class SECURE_ELEMENT_CARD_EMULATION_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EmulationOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static EmulationOnPowerIndependent => 1

    /**
     * @type {Integer (Int32)}
     */
    static EmulationOnPowerDependent => 2

    /**
     * @type {Integer (Int32)}
     */
    static EmulationStealthListen => 3
}
