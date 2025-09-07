#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_PMC_COUNTER_OWNER_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static EtwPmcOwnerFree => 0

    /**
     * @type {Integer (Int32)}
     */
    static EtwPmcOwnerUntagged => 1

    /**
     * @type {Integer (Int32)}
     */
    static EtwPmcOwnerTagged => 2

    /**
     * @type {Integer (Int32)}
     */
    static EtwPmcOwnerTaggedWithSource => 3
}
