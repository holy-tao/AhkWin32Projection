#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class GRP_PLACEMENT_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GRP_PLACEMENT_OPTIONS_MIN_VALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static GRP_PLACEMENT_OPTIONS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static GRP_PLACEMENT_OPTIONS_DISABLE_AUTOBALANCING => 1

    /**
     * @type {Integer (Int32)}
     */
    static GRP_PLACEMENT_OPTIONS_ALL => 1
}
