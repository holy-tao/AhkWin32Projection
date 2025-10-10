#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a disk object.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-getproperties">IVdsDisk::GetProperties</a> method returns 
  *     the value of this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/disk-object">disk object</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_disk_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DISK_PROP extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The GUID of the disk object.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The availability of a physical disk enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_status">VDS_DISK_STATUS</a>. 
     *       If the VDS service cannot open a handle to the disk, it sets this member to <b>VDS_DS_UNKNOWN</b>.
     * 
     * <div class="alert"><b>Note</b>  This member can be VDS_DS_ONLINE, even if the status of the containing pack is VDS_PS_OFFLINE.</div>
     * <div> </div>
     * @type {Integer}
     */
    status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * This member is reserved for future use.
     * @type {Integer}
     */
    ReserveMode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the disk. The following are the valid values for this member.
     * @type {Integer}
     */
    health {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The device type defined in Winioctl.h, which includes the following types among others:
     * @type {Integer}
     */
    dwDeviceType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A media type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a>. 
     *       Basic and dynamic disks map to the <b>FixedMedia</b> enumerator. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a>.
     * @type {Integer}
     */
    dwMediaType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The size of the disk in bytes. To determine the maximum volume size for a disk, call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk3-queryfreeextents">IVdsDisk3::QueryFreeExtents</a> and add the sizes of all 
     *       free extents.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of bytes in each sector.
     * @type {Integer}
     */
    ulBytesPerSector {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of sectors in each track.
     * @type {Integer}
     */
    ulSectorsPerTrack {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of tracks in each cylinder.
     * @type {Integer}
     */
    ulTracksPerCylinder {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A bitmask of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_flag">VDS_DISK_FLAG</a> enumeration values that specify various disk attributes.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The input/output bus types enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a>.
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a> enumeration value that specifies the partition type. This member is the 
     *       discriminant for the union.
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DiskGuid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The address of a SCSI-like disk in 
     *       Port<i>NNN</i>Path<i>NNN</i>Target<i>NNN</i>Lun<i>NNN</i> 
     *       format, where <i>NNN</i> is one or more digits.
     *       
     * 
     * SCSI disks, IDE disks, and Fibre Channel disks can have such an address. USB and 1394 disks have different 
     *        address formats and are not stored.
     * 
     * This member is optional and can be <b>NULL</b> if no value is available. If it is not <b>NULL</b>, its length must be greater than or equal to 22 WCHAR and less than or equal to 64 WCHAR, including the required <b>NULL</b> terminator. Applications that receive the <b>VDS_DISK_PROP</b> structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-getproperties">IVdsDisk::GetProperties</a> must check whether this member is <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    pwszDiskAddress {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The name used to open a handle to an object created using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> 
     *       function. For example: `\\?\PhysicalDrive2`
     * @type {Pointer<Char>}
     */
    pwszName {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The name returned by the Plug and Play   Manager. This name is maintained in the Windows registry by the 
     *       Plug and Play Manager, for example: "SEAGATE ST34573N SCSI Disk Device".
     * @type {Pointer<Char>}
     */
    pwszFriendlyName {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The name of the adapter to which this disk is attached. The Plug and Play Manager returns the name, which 
     *       is maintained in the Windows registry, for example: "Adaptec AHA-2940U2W - Ultra2 SCSI".
     * @type {Pointer<Char>}
     */
    pwszAdaptorName {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * The string returned by the Plug and Play Manager. The Plug and Play Manager uses the device path to 
     *       uniquely identify a device on a computer. For more information, see 
     *       [**SP_DEVICE_INTERFACE_DETAIL_DATA_W**](/windows/desktop/api/setupapi/ns-setupapi-sp_device_interface_detail_data_w).
     * @type {Pointer<Char>}
     */
    pwszDevicePath {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
