#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class AddressSpaceRelation{

    /**
     * @type {Integer (Int32)}
     */
    static Disjoint => 0

    /**
     * @type {Integer (Int32)}
     */
    static Equal => 1

    /**
     * @type {Integer (Int32)}
     */
    static Overlapping => 2

    /**
     * @type {Integer (Int32)}
     */
    static Subset => 3

    /**
     * @type {Integer (Int32)}
     */
    static Superset => 4
}
