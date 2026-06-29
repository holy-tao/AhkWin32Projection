#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_STORAGE_BUS_TYPE.ahk" { VDS_STORAGE_BUS_TYPE }
#Import ".\VDS_PARTITION_STYLE.ahk" { VDS_PARTITION_STYLE }
#Import ".\VDS_DISK_STATUS.ahk" { VDS_DISK_STATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import ".\VDS_LUN_RESERVE_MODE.ahk" { VDS_LUN_RESERVE_MODE }

/**
 * Defines the properties of a disk object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-getproperties">IVdsDisk::GetProperties</a> method returns 
 *     the value of this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/disk-object">disk object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_disk_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DISK_PROP {
    #StructPack 8

    /**
     * The GUID of the disk object.
     */
    id : Guid

    /**
     * The availability of a physical disk enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_status">VDS_DISK_STATUS</a>. 
     *       If the VDS service cannot open a handle to the disk, it sets this member to <b>VDS_DS_UNKNOWN</b>.
     * 
     * <div class="alert"><b>Note</b>  This member can be VDS_DS_ONLINE, even if the status of the containing pack is VDS_PS_OFFLINE.</div>
     * <div> </div>
     */
    status : VDS_DISK_STATUS

    /**
     * This member is reserved for future use.
     */
    ReserveMode : VDS_LUN_RESERVE_MODE

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the disk. The following are the valid values for this member.
     */
    health : VDS_HEALTH

    /**
     * The device type defined in Winioctl.h, which includes the following types among others:
     */
    dwDeviceType : UInt32

    /**
     * A media type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a>. 
     *       Basic and dynamic disks map to the <b>FixedMedia</b> enumerator. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a>.
     */
    dwMediaType : UInt32

    /**
     * The size of the disk in bytes. To determine the maximum volume size for a disk, call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk3-queryfreeextents">IVdsDisk3::QueryFreeExtents</a> and add the sizes of all 
     *       free extents.
     */
    ullSize : Int64

    /**
     * The number of bytes in each sector.
     */
    ulBytesPerSector : UInt32

    /**
     * The number of sectors in each track.
     */
    ulSectorsPerTrack : UInt32

    /**
     * The number of tracks in each cylinder.
     */
    ulTracksPerCylinder : UInt32

    /**
     * A bitmask of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_flag">VDS_DISK_FLAG</a> enumeration values that specify various disk attributes.
     */
    ulFlags : UInt32

    /**
     * The input/output bus types enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a>.
     */
    BusType : VDS_STORAGE_BUS_TYPE

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a> enumeration value that specifies the partition type. This member is the 
     *       discriminant for the union.
     */
    PartitionStyle : VDS_PARTITION_STYLE

    dwSignature : UInt32

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
     */
    pwszDiskAddress : PWSTR

    /**
     * The name used to open a handle to an object created using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> 
     *       function. For example: `\\?\PhysicalDrive2`
     */
    pwszName : PWSTR

    /**
     * The name returned by the Plug and Play Manager. This name is maintained in the Windows registry by the 
     *       Plug and Play Manager, for example: "SEAGATE ST34573N SCSI Disk Device".
     */
    pwszFriendlyName : PWSTR

    /**
     * The name of the adapter to which this disk is attached. The Plug and Play Manager returns the name, which 
     *       is maintained in the Windows registry, for example: "Adaptec AHA-2940U2W - Ultra2 SCSI".
     */
    pwszAdaptorName : PWSTR

    /**
     * The string returned by the Plug and Play Manager. The Plug and Play Manager uses the device path to 
     *       uniquely identify a device on a computer. For more information, see 
     *       [**SP_DEVICE_INTERFACE_DETAIL_DATA_W**](/windows/desktop/api/setupapi/ns-setupapi-sp_device_interface_detail_data_w).
     */
    pwszDevicePath : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'DiskGuid', { type: Guid, offset: 72 })
        this.DeleteProp("__New")
    }
}
