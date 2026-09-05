#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VBICODECFILTERING extends Win32Enum {

    /**
     * Native name: KSPROPERTY_VBICODECFILTERING_SCANLINES_REQUESTED_BIT_ARRAY
     * @type {Integer (Int32)}
     */
    static SCANLINES_REQUESTED_BIT_ARRAY => 1

    /**
     * Native name: KSPROPERTY_VBICODECFILTERING_SCANLINES_DISCOVERED_BIT_ARRAY
     * @type {Integer (Int32)}
     */
    static SCANLINES_DISCOVERED_BIT_ARRAY => 2

    /**
     * Native name: KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_REQUESTED_BIT_ARRAY
     * @type {Integer (Int32)}
     */
    static SUBSTREAMS_REQUESTED_BIT_ARRAY => 3

    /**
     * Native name: KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_DISCOVERED_BIT_ARRAY
     * @type {Integer (Int32)}
     */
    static SUBSTREAMS_DISCOVERED_BIT_ARRAY => 4

    /**
     * Native name: KSPROPERTY_VBICODECFILTERING_STATISTICS
     * @type {Integer (Int32)}
     */
    static STATISTICS => 5
}
