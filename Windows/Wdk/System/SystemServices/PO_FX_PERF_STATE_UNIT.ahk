#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PO_FX_PERF_STATE_UNIT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateUnitOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateUnitFrequency => 1

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateUnitBandwidth => 2

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateUnitMaximum => 3
}
