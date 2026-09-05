#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TUNER_MODES extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TUNER_MODE_TV
     * @type {Integer (Int32)}
     */
    static MODE_TV => 1

    /**
     * Native name: KSPROPERTY_TUNER_MODE_FM_RADIO
     * @type {Integer (Int32)}
     */
    static MODE_FM_RADIO => 2

    /**
     * Native name: KSPROPERTY_TUNER_MODE_AM_RADIO
     * @type {Integer (Int32)}
     */
    static MODE_AM_RADIO => 4

    /**
     * Native name: KSPROPERTY_TUNER_MODE_DSS
     * @type {Integer (Int32)}
     */
    static MODE_DSS => 8

    /**
     * Native name: KSPROPERTY_TUNER_MODE_ATSC
     * @type {Integer (Int32)}
     */
    static MODE_ATSC => 16
}
