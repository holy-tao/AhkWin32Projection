#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid bus types of a storage device.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop2">VDS_DISK_PROP2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop2">VDS_DRIVE_PROP2</a> structures include a <b>VDS_STORAGE_BUS_TYPE</b> value as a member to specify the bus type of a LUN, disk, or drive.
  * 
  * <div class="alert"><b>Note</b>  The type specified in these structures matches the type that the driver or drivers reported and may not exactly match the hardware.</div>
  * <div> </div>
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_STORAGE_BUS_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_STORAGE_BUS_TYPE</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ne-vdslun-vds_storage_bus_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_STORAGE_BUS_TYPE{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeUnknown => 0

    /**
     * The storage bus type is SCSI.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeScsi => 1

    /**
     * The storage bus type is ATAPI.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeAtapi => 2

    /**
     * The storage bus type is ATA.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeAta => 3

    /**
     * The storage bus type is IEEE 1394.
     * @type {Integer (Int32)}
     */
    static VDSBusType1394 => 4

    /**
     * The storage bus type is SSA.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeSsa => 5

    /**
     * The storage bus type is Fibre Channel.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeFibre => 6

    /**
     * The storage bus type is USB.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeUsb => 7

    /**
     * The storage bus type is RAID.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeRAID => 8

    /**
     * The storage bus type is iSCSI.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeiScsi => 9

    /**
     * The storage bus type is Serial Attached SCSI (SAS).
     * @type {Integer (Int32)}
     */
    static VDSBusTypeSas => 10

    /**
     * The storage bus type is SATA.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeSata => 11

    /**
     * The storage bus type is Secure Digital (SD).
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeSd => 12

    /**
     * The storage bus type is MultiMedia Card (MMC).
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeMmc => 13

    /**
     * This value is reserved for system use.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeMax => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSBusTypeVirtual => 14

    /**
     * The storage bus type is file-backed virtual.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeFileBackedVirtual => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSBusTypeSpaces => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSBusTypeNVMe => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSBusTypeScm => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSBusTypeUfs => 19

    /**
     * The maximum value of the storage bus type range.
     * @type {Integer (Int32)}
     */
    static VDSBusTypeMaxReserved => 127
}
