#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_IDENTIFIER_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeVendorSpecific => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeVendorId => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeEUI64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeFCPHName => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypePortRelative => 4

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeTargetPortGroup => 5

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeLogicalUnitGroup => 6

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeMD5LogicalUnitIdentifier => 7

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdTypeScsiNameString => 8
}
