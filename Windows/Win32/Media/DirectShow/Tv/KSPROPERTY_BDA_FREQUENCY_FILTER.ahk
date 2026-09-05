#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_FREQUENCY_FILTER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_FREQUENCY
     * @type {Integer (Int32)}
     */
    static RF_TUNER_FREQUENCY => 0

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_POLARITY
     * @type {Integer (Int32)}
     */
    static RF_TUNER_POLARITY => 1

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_RANGE
     * @type {Integer (Int32)}
     */
    static RF_TUNER_RANGE => 2

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_TRANSPONDER
     * @type {Integer (Int32)}
     */
    static RF_TUNER_TRANSPONDER => 3

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_BANDWIDTH
     * @type {Integer (Int32)}
     */
    static RF_TUNER_BANDWIDTH => 4

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_FREQUENCY_MULTIPLIER
     * @type {Integer (Int32)}
     */
    static RF_TUNER_FREQUENCY_MULTIPLIER => 5

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_CAPS
     * @type {Integer (Int32)}
     */
    static RF_TUNER_CAPS => 6

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_SCAN_STATUS
     * @type {Integer (Int32)}
     */
    static RF_TUNER_SCAN_STATUS => 7

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_STANDARD
     * @type {Integer (Int32)}
     */
    static RF_TUNER_STANDARD => 8

    /**
     * Native name: KSPROPERTY_BDA_RF_TUNER_STANDARD_MODE
     * @type {Integer (Int32)}
     */
    static RF_TUNER_STANDARD_MODE => 9
}
