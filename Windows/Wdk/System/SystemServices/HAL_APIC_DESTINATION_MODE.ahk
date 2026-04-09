#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_APIC_DESTINATION_MODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ApicDestinationModePhysical => 1

    /**
     * @type {Integer (Int32)}
     */
    static ApicDestinationModeLogicalFlat => 2

    /**
     * @type {Integer (Int32)}
     */
    static ApicDestinationModeLogicalClustered => 3

    /**
     * @type {Integer (Int32)}
     */
    static ApicDestinationModeUnknown => 4
}
