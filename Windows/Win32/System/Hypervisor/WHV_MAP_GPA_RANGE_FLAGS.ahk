#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_MAP_GPA_RANGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagRead => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagWrite => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagExecute => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvMapGpaRangeFlagTrackDirtyPages => 8
}
