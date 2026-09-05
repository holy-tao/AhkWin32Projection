#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_DIGITAL_DEMODULATOR extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_MODULATION_TYPE
     * @type {Integer (Int32)}
     */
    static MODULATION_TYPE => 0

    /**
     * Native name: KSPROPERTY_BDA_INNER_FEC_TYPE
     * @type {Integer (Int32)}
     */
    static INNER_FEC_TYPE => 1

    /**
     * Native name: KSPROPERTY_BDA_INNER_FEC_RATE
     * @type {Integer (Int32)}
     */
    static INNER_FEC_RATE => 2

    /**
     * Native name: KSPROPERTY_BDA_OUTER_FEC_TYPE
     * @type {Integer (Int32)}
     */
    static OUTER_FEC_TYPE => 3

    /**
     * Native name: KSPROPERTY_BDA_OUTER_FEC_RATE
     * @type {Integer (Int32)}
     */
    static OUTER_FEC_RATE => 4

    /**
     * Native name: KSPROPERTY_BDA_SYMBOL_RATE
     * @type {Integer (Int32)}
     */
    static SYMBOL_RATE => 5

    /**
     * Native name: KSPROPERTY_BDA_SPECTRAL_INVERSION
     * @type {Integer (Int32)}
     */
    static SPECTRAL_INVERSION => 6

    /**
     * Native name: KSPROPERTY_BDA_GUARD_INTERVAL
     * @type {Integer (Int32)}
     */
    static GUARD_INTERVAL => 7

    /**
     * Native name: KSPROPERTY_BDA_TRANSMISSION_MODE
     * @type {Integer (Int32)}
     */
    static TRANSMISSION_MODE => 8

    /**
     * Native name: KSPROPERTY_BDA_ROLL_OFF
     * @type {Integer (Int32)}
     */
    static ROLL_OFF => 9

    /**
     * Native name: KSPROPERTY_BDA_PILOT
     * @type {Integer (Int32)}
     */
    static PILOT => 10

    /**
     * Native name: KSPROPERTY_BDA_SIGNALTIMEOUTS
     * @type {Integer (Int32)}
     */
    static SIGNALTIMEOUTS => 11

    /**
     * Native name: KSPROPERTY_BDA_PLP_NUMBER
     * @type {Integer (Int32)}
     */
    static PLP_NUMBER => 12
}
