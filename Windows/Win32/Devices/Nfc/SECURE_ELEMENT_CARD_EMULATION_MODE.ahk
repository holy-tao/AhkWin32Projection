#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class SECURE_ELEMENT_CARD_EMULATION_MODE extends Win32Enum {

    /**
     * Native name: EmulationOff
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Native name: EmulationOnPowerIndependent
     * @type {Integer (Int32)}
     */
    static OnPowerIndependent => 1

    /**
     * Native name: EmulationOnPowerDependent
     * @type {Integer (Int32)}
     */
    static OnPowerDependent => 2

    /**
     * Native name: EmulationStealthListen
     * @type {Integer (Int32)}
     */
    static StealthListen => 3
}
