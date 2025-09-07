#Requires AutoHotkey v2.0.0 64-bit

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
 * @version v4.0.30319
 */
class VDS_STORAGE_IDENTIFIER_TYPE{

    /**
     * The storage identifier type is vendor specific.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeVendorSpecific => 0

    /**
     * The storage identifier is the same as the vendor identifier.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeVendorId => 1

    /**
     * The storage identifier type follows the IEEE 64-bit Extended Unique Identifier (EUI-64) standard.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeEUI64 => 2

    /**
     * The storage identifier type follows the Fibre Channel Physical and Signaling Interface (FC-PH) naming 
 *       convention.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeFCPHName => 3

    /**
     * <b>VDS 1.1:  </b>The storage identifier type is dependent on the port.
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypePortRelative => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeTargetPortGroup => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeLogicalUnitGroup => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeMD5LogicalUnitIdentifier => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSStorageIdTypeScsiNameString => 8
}
