#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PO_FX_PERF_STATE_UNIT extends Win32Enum {

    /**
     * Native name: PoFxPerfStateUnitOther
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Native name: PoFxPerfStateUnitFrequency
     * @type {Integer (Int32)}
     */
    static Frequency => 1

    /**
     * Native name: PoFxPerfStateUnitBandwidth
     * @type {Integer (Int32)}
     */
    static Bandwidth => 2

    /**
     * Native name: PoFxPerfStateUnitMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 3
}
