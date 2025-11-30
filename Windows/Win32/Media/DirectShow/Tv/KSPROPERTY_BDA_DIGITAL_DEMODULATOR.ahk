#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_DIGITAL_DEMODULATOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_MODULATION_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_INNER_FEC_TYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_INNER_FEC_RATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_OUTER_FEC_TYPE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_OUTER_FEC_RATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SYMBOL_RATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SPECTRAL_INVERSION => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_GUARD_INTERVAL => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_TRANSMISSION_MODE => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_ROLL_OFF => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_PILOT => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SIGNALTIMEOUTS => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_PLP_NUMBER => 12
}
