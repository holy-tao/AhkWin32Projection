#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_WBPRESET extends Win32Enum {

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WBPRESET_CLOUDY
     * @type {Integer (Int32)}
     */
    static CLOUDY => 1

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WBPRESET_DAYLIGHT
     * @type {Integer (Int32)}
     */
    static DAYLIGHT => 2

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WBPRESET_FLASH
     * @type {Integer (Int32)}
     */
    static FLASH => 3

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WBPRESET_FLUORESCENT
     * @type {Integer (Int32)}
     */
    static FLUORESCENT => 4

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WBPRESET_TUNGSTEN
     * @type {Integer (Int32)}
     */
    static TUNGSTEN => 5

    /**
     * Native name: KSCAMERA_EXTENDEDPROP_WBPRESET_CANDLELIGHT
     * @type {Integer (Int32)}
     */
    static CANDLELIGHT => 6
}
