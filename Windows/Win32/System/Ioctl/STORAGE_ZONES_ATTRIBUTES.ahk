#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ZONES_ATTRIBUTES extends Win32Enum {

    /**
     * Native name: ZonesAttributeTypeAndLengthMayDifferent
     * @type {Integer (Int32)}
     */
    static AttributeTypeAndLengthMayDifferent => 0

    /**
     * Native name: ZonesAttributeTypeSameLengthSame
     * @type {Integer (Int32)}
     */
    static AttributeTypeSameLengthSame => 1

    /**
     * Native name: ZonesAttributeTypeSameLastZoneLengthDifferent
     * @type {Integer (Int32)}
     */
    static AttributeTypeSameLastZoneLengthDifferent => 2

    /**
     * Native name: ZonesAttributeTypeMayDifferentLengthSame
     * @type {Integer (Int32)}
     */
    static AttributeTypeMayDifferentLengthSame => 3
}
