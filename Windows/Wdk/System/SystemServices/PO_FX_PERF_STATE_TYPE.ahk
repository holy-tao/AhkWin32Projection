#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PO_FX_PERF_STATE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateTypeDiscrete => 0

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateTypeRange => 1

    /**
     * @type {Integer (Int32)}
     */
    static PoFxPerfStateTypeMaximum => 2
}
