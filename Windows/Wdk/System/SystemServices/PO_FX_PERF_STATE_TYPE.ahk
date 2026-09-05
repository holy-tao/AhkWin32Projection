#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PO_FX_PERF_STATE_TYPE extends Win32Enum {

    /**
     * Native name: PoFxPerfStateTypeDiscrete
     * @type {Integer (Int32)}
     */
    static Discrete => 0

    /**
     * Native name: PoFxPerfStateTypeRange
     * @type {Integer (Int32)}
     */
    static Range => 1

    /**
     * Native name: PoFxPerfStateTypeMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 2
}
