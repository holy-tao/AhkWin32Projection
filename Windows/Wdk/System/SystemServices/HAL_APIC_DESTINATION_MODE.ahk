#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_APIC_DESTINATION_MODE extends Win32Enum {

    /**
     * Native name: ApicDestinationModePhysical
     * @type {Integer (Int32)}
     */
    static Physical => 1

    /**
     * Native name: ApicDestinationModeLogicalFlat
     * @type {Integer (Int32)}
     */
    static LogicalFlat => 2

    /**
     * Native name: ApicDestinationModeLogicalClustered
     * @type {Integer (Int32)}
     */
    static LogicalClustered => 3

    /**
     * Native name: ApicDestinationModeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 4
}
