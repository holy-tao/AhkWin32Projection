#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TUNER_MODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_TV => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_FM_RADIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_AM_RADIO => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_DSS => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_ATSC => 16
}
