#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid types for a storage identifier.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> structure 
 *     includes a <b>VDS_STORAGE_IDENTIFIER_TYPE</b> value as a member to indicate the storage identifier type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_STORAGE_IDENTIFIER_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_STORAGE_IDENTIFIER_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ne-vdslun-vds_storage_identifier_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_STORAGE_IDENTIFIER_TYPE extends Win32Enum {

    /**
     * The storage identifier type is vendor specific.
     * Native name: VDSStorageIdTypeVendorSpecific
     * @type {Integer (Int32)}
     */
    static IdTypeVendorSpecific => 0

    /**
     * The storage identifier is the same as the vendor identifier.
     * Native name: VDSStorageIdTypeVendorId
     * @type {Integer (Int32)}
     */
    static IdTypeVendorId => 1

    /**
     * The storage identifier type follows the IEEE 64-bit Extended Unique Identifier (EUI-64) standard.
     * Native name: VDSStorageIdTypeEUI64
     * @type {Integer (Int32)}
     */
    static IdTypeEUI64 => 2

    /**
     * The storage identifier type follows the Fibre Channel Physical and Signaling Interface (FC-PH) naming 
     *       convention.
     * Native name: VDSStorageIdTypeFCPHName
     * @type {Integer (Int32)}
     */
    static IdTypeFCPHName => 3

    /**
     * <b>VDS 1.1:  </b>The storage identifier type is dependent on the port.
     * Native name: VDSStorageIdTypePortRelative
     * @type {Integer (Int32)}
     */
    static IdTypePortRelative => 4

    /**
     * Native name: VDSStorageIdTypeTargetPortGroup
     * @type {Integer (Int32)}
     */
    static IdTypeTargetPortGroup => 5

    /**
     * Native name: VDSStorageIdTypeLogicalUnitGroup
     * @type {Integer (Int32)}
     */
    static IdTypeLogicalUnitGroup => 6

    /**
     * Native name: VDSStorageIdTypeMD5LogicalUnitIdentifier
     * @type {Integer (Int32)}
     */
    static IdTypeMD5LogicalUnitIdentifier => 7

    /**
     * Native name: VDSStorageIdTypeScsiNameString
     * @type {Integer (Int32)}
     */
    static IdTypeScsiNameString => 8
}
