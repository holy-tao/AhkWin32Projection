#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class ARBITER_REQUEST_SOURCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterRequestUndefined => -1

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterRequestLegacyReported => 0

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterRequestHalReported => 1

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterRequestLegacyAssigned => 2

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterRequestPnpDetected => 3

    /**
     * @type {Integer (Int32)}
     */
    static ArbiterRequestPnpEnumerated => 4
}
