#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class GRP_PLACEMENT_OPTIONS extends Win32Enum {

    /**
     * Native name: GRP_PLACEMENT_OPTIONS_MIN_VALUE
     * @type {Integer (Int32)}
     */
    static MIN_VALUE => 0

    /**
     * Native name: GRP_PLACEMENT_OPTIONS_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: GRP_PLACEMENT_OPTIONS_DISABLE_AUTOBALANCING
     * @type {Integer (Int32)}
     */
    static DISABLE_AUTOBALANCING => 1

    /**
     * Native name: GRP_PLACEMENT_OPTIONS_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 1
}
