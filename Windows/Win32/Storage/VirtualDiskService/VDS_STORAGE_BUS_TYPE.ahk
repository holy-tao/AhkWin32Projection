#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
 */
class VDS_STORAGE_BUS_TYPE extends Win32Enum {

    /**
     * This value is reserved.
     * Native name: VDSBusTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The storage bus type is SCSI.
     * Native name: VDSBusTypeScsi
     * @type {Integer (Int32)}
     */
    static Scsi => 1

    /**
     * The storage bus type is ATAPI.
     * Native name: VDSBusTypeAtapi
     * @type {Integer (Int32)}
     */
    static Atapi => 2

    /**
     * The storage bus type is ATA.
     * Native name: VDSBusTypeAta
     * @type {Integer (Int32)}
     */
    static Ata => 3

    /**
     * The storage bus type is IEEE 1394.
     * Native name: VDSBusType1394
     * @type {Integer (Int32)}
     */
    static Type1394 => 4

    /**
     * The storage bus type is SSA.
     * Native name: VDSBusTypeSsa
     * @type {Integer (Int32)}
     */
    static Ssa => 5

    /**
     * The storage bus type is Fibre Channel.
     * Native name: VDSBusTypeFibre
     * @type {Integer (Int32)}
     */
    static Fibre => 6

    /**
     * The storage bus type is USB.
     * Native name: VDSBusTypeUsb
     * @type {Integer (Int32)}
     */
    static Usb => 7

    /**
     * The storage bus type is RAID.
     * Native name: VDSBusTypeRAID
     * @type {Integer (Int32)}
     */
    static TypeRAID => 8

    /**
     * The storage bus type is iSCSI.
     * Native name: VDSBusTypeiScsi
     * @type {Integer (Int32)}
     */
    static TypeiScsi => 9

    /**
     * The storage bus type is Serial Attached SCSI (SAS).
     * Native name: VDSBusTypeSas
     * @type {Integer (Int32)}
     */
    static Sas => 10

    /**
     * The storage bus type is SATA.
     * Native name: VDSBusTypeSata
     * @type {Integer (Int32)}
     */
    static Sata => 11

    /**
     * The storage bus type is Secure Digital (SD).
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * Native name: VDSBusTypeSd
     * @type {Integer (Int32)}
     */
    static Sd => 12

    /**
     * The storage bus type is MultiMedia Card (MMC).
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * Native name: VDSBusTypeMmc
     * @type {Integer (Int32)}
     */
    static Mmc => 13

    /**
     * This value is reserved for system use.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * Native name: VDSBusTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 14

    /**
     * Native name: VDSBusTypeVirtual
     * @type {Integer (Int32)}
     */
    static Virtual => 14

    /**
     * The storage bus type is file-backed virtual.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * Native name: VDSBusTypeFileBackedVirtual
     * @type {Integer (Int32)}
     */
    static FileBackedVirtual => 15

    /**
     * Native name: VDSBusTypeSpaces
     * @type {Integer (Int32)}
     */
    static Spaces => 16

    /**
     * Native name: VDSBusTypeNVMe
     * @type {Integer (Int32)}
     */
    static TypeNVMe => 17

    /**
     * Native name: VDSBusTypeScm
     * @type {Integer (Int32)}
     */
    static Scm => 18

    /**
     * Native name: VDSBusTypeUfs
     * @type {Integer (Int32)}
     */
    static Ufs => 19

    /**
     * The maximum value of the storage bus type range.
     * Native name: VDSBusTypeMaxReserved
     * @type {Integer (Int32)}
     */
    static MaxReserved => 127
}
