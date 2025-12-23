#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_POOL_REGION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionSpecial => 1

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionPaged => 2

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionNonPaged => 3

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionNonPagedExpansion => 4

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionSessionPaged => 5

    /**
     * @type {Integer (Int32)}
     */
    static DbgPoolRegionMax => 6
}
