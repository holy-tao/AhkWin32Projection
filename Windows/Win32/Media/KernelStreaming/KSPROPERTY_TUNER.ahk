#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TUNER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TUNER_CAPS
     * @type {Integer (Int32)}
     */
    static CAPS => 0

    /**
     * Native name: KSPROPERTY_TUNER_MODE_CAPS
     * @type {Integer (Int32)}
     */
    static MODE_CAPS => 1

    /**
     * Native name: KSPROPERTY_TUNER_MODE
     * @type {Integer (Int32)}
     */
    static MODE => 2

    /**
     * Native name: KSPROPERTY_TUNER_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 3

    /**
     * Native name: KSPROPERTY_TUNER_FREQUENCY
     * @type {Integer (Int32)}
     */
    static FREQUENCY => 4

    /**
     * Native name: KSPROPERTY_TUNER_INPUT
     * @type {Integer (Int32)}
     */
    static INPUT => 5

    /**
     * Native name: KSPROPERTY_TUNER_STATUS
     * @type {Integer (Int32)}
     */
    static STATUS => 6

    /**
     * Native name: KSPROPERTY_TUNER_IF_MEDIUM
     * @type {Integer (Int32)}
     */
    static IF_MEDIUM => 7

    /**
     * Native name: KSPROPERTY_TUNER_SCAN_CAPS
     * @type {Integer (Int32)}
     */
    static SCAN_CAPS => 8

    /**
     * Native name: KSPROPERTY_TUNER_SCAN_STATUS
     * @type {Integer (Int32)}
     */
    static SCAN_STATUS => 9

    /**
     * Native name: KSPROPERTY_TUNER_STANDARD_MODE
     * @type {Integer (Int32)}
     */
    static STANDARD_MODE => 10

    /**
     * Native name: KSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS
     * @type {Integer (Int32)}
     */
    static NETWORKTYPE_SCAN_CAPS => 11
}
