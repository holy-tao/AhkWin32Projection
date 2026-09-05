#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_IDENTIFIER_TYPE extends Win32Enum {

    /**
     * Native name: StorageIdTypeVendorSpecific
     * @type {Integer (Int32)}
     */
    static IdTypeVendorSpecific => 0

    /**
     * Native name: StorageIdTypeVendorId
     * @type {Integer (Int32)}
     */
    static IdTypeVendorId => 1

    /**
     * Native name: StorageIdTypeEUI64
     * @type {Integer (Int32)}
     */
    static IdTypeEUI64 => 2

    /**
     * Native name: StorageIdTypeFCPHName
     * @type {Integer (Int32)}
     */
    static IdTypeFCPHName => 3

    /**
     * Native name: StorageIdTypePortRelative
     * @type {Integer (Int32)}
     */
    static IdTypePortRelative => 4

    /**
     * Native name: StorageIdTypeTargetPortGroup
     * @type {Integer (Int32)}
     */
    static IdTypeTargetPortGroup => 5

    /**
     * Native name: StorageIdTypeLogicalUnitGroup
     * @type {Integer (Int32)}
     */
    static IdTypeLogicalUnitGroup => 6

    /**
     * Native name: StorageIdTypeMD5LogicalUnitIdentifier
     * @type {Integer (Int32)}
     */
    static IdTypeMD5LogicalUnitIdentifier => 7

    /**
     * Native name: StorageIdTypeScsiNameString
     * @type {Integer (Int32)}
     */
    static IdTypeScsiNameString => 8
}
