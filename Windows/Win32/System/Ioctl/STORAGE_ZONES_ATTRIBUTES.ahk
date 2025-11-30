#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ZONES_ATTRIBUTES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ZonesAttributeTypeAndLengthMayDifferent => 0

    /**
     * @type {Integer (Int32)}
     */
    static ZonesAttributeTypeSameLengthSame => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZonesAttributeTypeSameLastZoneLengthDifferent => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZonesAttributeTypeMayDifferentLengthSame => 3
}
