#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_CLOCK extends Win32Enum {

    /**
     * Native name: KSPROPERTY_CLOCK_TIME
     * @type {Integer (Int32)}
     */
    static TIME => 0

    /**
     * Native name: KSPROPERTY_CLOCK_PHYSICALTIME
     * @type {Integer (Int32)}
     */
    static PHYSICALTIME => 1

    /**
     * Native name: KSPROPERTY_CLOCK_CORRELATEDTIME
     * @type {Integer (Int32)}
     */
    static CORRELATEDTIME => 2

    /**
     * Native name: KSPROPERTY_CLOCK_CORRELATEDPHYSICALTIME
     * @type {Integer (Int32)}
     */
    static CORRELATEDPHYSICALTIME => 3

    /**
     * Native name: KSPROPERTY_CLOCK_RESOLUTION
     * @type {Integer (Int32)}
     */
    static RESOLUTION => 4

    /**
     * Native name: KSPROPERTY_CLOCK_STATE
     * @type {Integer (Int32)}
     */
    static STATE => 5
}
