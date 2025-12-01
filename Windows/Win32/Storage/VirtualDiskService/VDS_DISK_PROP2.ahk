#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a disk object. This structure is identical to the VDS_DISK_PROP structure, except that it also includes the location path and, if the disk is offline, the reason why it is offline.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk3-getproperties2">IVdsDisk3::GetProperties2</a> method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/disk-object">disk object</a>.
 * 
 * The following table lists the parts of the location path string used in the <b>pwszLocationPath</b> member.
 * 
 * <table>
 * <tr>
 * <th>Location path part</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td><i>AdapterPnpLocationPath</i></td>
 * <td>The adapter's PnP location path. This is retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdigetdevicepropertyw">SetupDiGetDeviceProperty</a> function, passing &amp;DEVPKEY_Device_LocationPaths for the <i>PropertyKey</i> parameter.</td>
 * </tr>
 * <tr>
 * <td><i>BusType</i></td>
 * <td>The bus type: ATA, RAID, SAS, or SCSI. <div class="alert"><b>Note</b>  If the bus type is IDE, PATA, or SATA, it appears as ATA in the location path string. If it is PCI RAID, it appears as RAID.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td><i>PathId</i></td>
 * <td>The number of the bus. This is the value of the <b>PathId</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddscsi/ns-ntddscsi-_scsi_address">SCSI_ADDRESS</a> structure that is returned by the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddscsi/ni-ntddscsi-ioctl_scsi_get_address">IOCTL_SCSI_GET_ADDRESS</a> control code.</td>
 * </tr>
 * <tr>
 * <td><i>TargetId</i></td>
 * <td>The number of the target device. This is the value of the <b>TargetId</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddscsi/ns-ntddscsi-_scsi_address">SCSI_ADDRESS</a> structure that is returned by the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddscsi/ni-ntddscsi-ioctl_scsi_get_address">IOCTL_SCSI_GET_ADDRESS</a> control code.</td>
 * </tr>
 * <tr>
 * <td><i>LunId</i></td>
 * <td>The number of the LUN. This is the value of the <b>Lun</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddscsi/ns-ntddscsi-_scsi_address">SCSI_ADDRESS</a> structure that is returned by the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddscsi/ni-ntddscsi-ioctl_scsi_get_address">IOCTL_SCSI_GET_ADDRESS</a> control code.</td>
 * </tr>
 * </table>
 *  
 * 
 * The following table contains examples of location paths.
 * 
 * <table>
 * <tr>
 * <th>Bus type</th>
 * <th>Example location path</th>
 * </tr>
 * <tr>
 * <td>ATA</td>
 * <td>PCIROOT(0)#PCI(0100)#ATA(C01T03L00)</td>
 * </tr>
 * <tr>
 * <td>RAID</td>
 * <td>PCIROOT(0)#PCI(0200)#PCI(0003)#PCI(0100)#RAID(P02T00L00)</td>
 * </tr>
 * <tr>
 * <td>SAS</td>
 * <td>PCIROOT(1)#PCI(0300)#SAS(P00T03L00)</td>
 * </tr>
 * <tr>
 * <td>SCSI</td>
 * <td>PCIROOT(0)#PCI(1C00)#PCI(0000)#SCSI(P00T01L01)</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_disk_prop2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DISK_PROP2 extends Win32Struct
{
    static sizeof => 120

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
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_status">VDS_DISK_STATUS</a> enumeration value that specifies the status of the disk.If the VDS service cannot open a handle to the disk, it sets this member to <b>VDS_DS_UNKNOWN</b>.
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
     * If the disk is offline, this member is a <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_offline_reason">VDS_DISK_OFFLINE_REASON</a> enumeration value that specifies the reason why it is offline.
     * @type {Integer}
     */
    OfflineReason {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * This member is reserved for future use.
     * @type {Integer}
     */
    ReserveMode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the disk. The following are the valid values for this member.
     * @type {Integer}
     */
    health {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The device type defined in Winioctl.h, which includes the following types among others:
     * @type {Integer}
     */
    dwDeviceType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A media type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a>. 
     *       Basic and dynamic disks map to the <b>FixedMedia</b> enumerator. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_media_type">STORAGE_MEDIA_TYPE</a>.
     * @type {Integer}
     */
    dwMediaType {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
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
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a> enumeration that specifies the partition style. This member is the 
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
     * This member is optional and can be <b>NULL</b> if no value is available. If it is not <b>NULL</b>, its length must be greater than or equal to 22 WCHAR and less than or equal to 64 WCHAR, including the required <b>NULL</b> terminator. Applications that receive the <b>VDS_DISK_PROP2</b> structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk3-getproperties2">IVdsDisk3::GetProperties2</a> must check whether this member is <b>NULL</b>.
     * @type {PWSTR}
     */
    pwszDiskAddress {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The name used to open a handle to an object created using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> 
     *       function. For example:
     * @type {PWSTR}
     */
    pwszName {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The name returned by the Plug and Play   (PnP) Manager. This name is maintained in the Windows registry by the 
     *       Plug and Play Manager, for example: "SEAGATE ST34573N SCSI Disk Device".
     * @type {PWSTR}
     */
    pwszFriendlyName {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The name of the adapter to which this disk is attached. The PnP Manager returns the name, which 
     *       is maintained in the Windows registry, for example: "Adaptec AHA-2940U2W - Ultra2 SCSI".
     * @type {PWSTR}
     */
    pwszAdaptorName {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * The string returned by the PnP Manager. The PnP Manager uses the device path to 
     *       uniquely identify a device on a computer. For more information, see 
     *       [**SP_DEVICE_INTERFACE_DETAIL_DATA_W**](/windows/desktop/api/setupapi/ns-setupapi-sp_device_interface_detail_data_w).
     * @type {PWSTR}
     */
    pwszDevicePath {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A string that contains the PnP location path of the disk. The format of this string depends on the bus type. If the bus type is SCSI, SAS, or PCI RAID, the format is <i>AdapterPnpLocationPath</i>#<i>BusType</i>(P<i>PathId</i>T<i>TargetId</i>L<i>LunId</i>). If the bus type is IDE, ATA, PATA, or SATA, the format is <i>AdapterPnpLocationPath</i>#<i>BusType</i>(C<i>PathId</i>T<i>TargetId</i>L<i>LunId</i>). See the following Remarks section for a table that lists the parts of this string.
     * 
     * <div class="alert"><b>Note</b>  For Hyper-V, this member is <b>NULL</b>, because the virtual controller does not return the location path.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    pwszLocationPath {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
