#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_FREQUENCY_FILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_FREQUENCY => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_POLARITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_RANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_TRANSPONDER => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_BANDWIDTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_FREQUENCY_MULTIPLIER => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_CAPS => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_SCAN_STATUS => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_STANDARD => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_RF_TUNER_STANDARD_MODE => 9
}
