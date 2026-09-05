#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class ARBITER_REQUEST_SOURCE extends Win32Enum {

    /**
     * Native name: ArbiterRequestUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => -1

    /**
     * Native name: ArbiterRequestLegacyReported
     * @type {Integer (Int32)}
     */
    static LegacyReported => 0

    /**
     * Native name: ArbiterRequestHalReported
     * @type {Integer (Int32)}
     */
    static HalReported => 1

    /**
     * Native name: ArbiterRequestLegacyAssigned
     * @type {Integer (Int32)}
     */
    static LegacyAssigned => 2

    /**
     * Native name: ArbiterRequestPnpDetected
     * @type {Integer (Int32)}
     */
    static PnpDetected => 3

    /**
     * Native name: ArbiterRequestPnpEnumerated
     * @type {Integer (Int32)}
     */
    static PnpEnumerated => 4
}
