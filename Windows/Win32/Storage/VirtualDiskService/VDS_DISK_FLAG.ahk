#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid flags for a disk object.Note   Except for VDS_DF_READ_ONLY, these flags cannot be set by using the IVdsDisk::SetFlags method or cleared by using the IVdsDisk::ClearFlags method.
 * @remarks
 * 
 * This enumeration provides the values for the <b>ulFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop2">VDS_DISK_PROP2</a> structures. The <b>VDS_DISK_PROP</b> structure is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-getproperties">IVdsDisk::GetProperties</a> method. The <b>VDS_DISK_PROP2</b> structure is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk3-getproperties2">IVdsDisk3::GetProperties2</a> method.
 * 
 * All of the <b>VDS_DISK_FLAG</b> flag values are set by the VDS service; they cannot be set by applications. An exception is the <b>VDS_DF_READ_ONLY</b> flag, which can be set by using the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-setflags">IVdsDisk::SetFlags</a> method and cleared by using the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-clearflags">IVdsDisk::ClearFlags</a> method.
 * 
 * USB disks and CD-ROMs have the following restrictions and capabilities:
 * 
 * <ul>
 * <li>Dynamic disks are not supported on USB disks (including USB removable hard disks and USB flash drives).</li>
 * <li>A removable USB disk cannot be used as a boot disk.</li>
 * <li>You can <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-vista/cc766195(v=ws.10)">create a bootable WinPE RAM disk on a USB flash drive or CD-ROM</a>.<b>Windows Server 2003:  </b>Not supported.
 * 
 * </li>
 * <li>A USB flash drive can have only one partition. The partition type can be MBR or GPT.</li>
 * </ul>
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_DISK_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_DISK_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_disk_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DISK_FLAG{

    /**
     * The media in a CDROM or DVD drive is an audio CD.
     * @type {Integer (Int32)}
     */
    static VDS_DF_AUDIO_CD => 1

    /**
     * The disk is reserved for use only as hot spare.
     * @type {Integer (Int32)}
     */
    static VDS_DF_HOTSPARE => 2

    /**
     * This flag is reserved for future use. Do not use.
     * @type {Integer (Int32)}
     */
    static VDS_DF_RESERVE_CAPABLE => 4

    /**
     * The disk is masked.
     * @type {Integer (Int32)}
     */
    static VDS_DF_MASKED => 8

    /**
     * The partition style on disk can be converted between MBR and GPT.
     * @type {Integer (Int32)}
     */
    static VDS_DF_STYLE_CONVERTIBLE => 16

    /**
     * The disk is clustered.
     * @type {Integer (Int32)}
     */
    static VDS_DF_CLUSTERED => 32

    /**
     * This flag indicates that the disk's read-only attribute, which is maintained by the Windows operating system, is set. This attribute  can be set by using the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-setflags">IVdsDisk::SetFlags</a> method and cleared by using the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-clearflags">IVdsDisk::ClearFlags</a> method. This flag and the corresponding attribute do not necessarily reflect the actual read-only state of the disk, which is indicated by the <b>VDS_DF_CURRENT_READ_ONLY</b> flag.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_READ_ONLY => 64

    /**
     * The disk hosts the current system volume. If the disk is dynamic and the volume is a mirror, the flag is set on the disk that holds the plex that was used as the system volume at startup.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_SYSTEM_DISK => 128

    /**
     * The disk hosts the current boot volume.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_BOOT_DISK => 256

    /**
     * The disk contains a pagefile.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_PAGEFILE_DISK => 512

    /**
     * The disk contains the hibernation volume.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_HIBERNATIONFILE_DISK => 1024

    /**
     * The disk contains the crashdump volume.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_CRASHDUMP_DISK => 2048

    /**
     * The disk is visible to the computer at startup. For GPT, this flag is set for all disks. For MBR, it is set only for disks that are visible to the computer's BIOS firmware. (This is generally the first 12 disks that are connected to the computer and visible to the BIOS at startup.)
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_HAS_ARC_PATH => 4096

    /**
     * The disk is a dynamic disk.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>Not supported before Windows Vista with SP1 and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static VDS_DF_DYNAMIC => 8192

    /**
     * This flag is set on the hard disk from which the computer is configured to start.
     * 
     * On computers that use the BIOS firmware, this is the first hard disk that the firmware detects when the computer starts up (device 80H, or 81H if 80H is assigned to a USB flash device). If the user plugs a USB flash device into the computer before startup, this may cause device 80H to be assigned to the USB device and may cause 81H to be assigned the first hard disk detected by the firmware. Note that  in that case, this flag is not set on the USB flash device.
     * 
     * On computers that use the Extended Firmware Interface (EFI), this flag is set on the disk that contains the EFI System Partition (ESP) that was used to start the computer. Note that if none of the disks contain an ESP, or if there are multiple ESPs, this flag is not set on any of the disks.<b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DF_BOOT_FROM_DISK => 16384

    /**
     * This flag indicates that the disk is in a read-only state. If it is not set, the disk is read/write. Unlike the <b>VDS_DF_READ_ONLY</b> flag, which is used to change the disk's read-only attribute maintained by the Windows operating system, this flag reflects the actual disk state.  This flag  cannot be set by using the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-setflags">IVdsDisk::SetFlags</a> method or cleared by using the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-clearflags">IVdsDisk::ClearFlags</a> method.
     * 
     * The disk will be in a read-only state if its read-only attribute is set. However, a  disk can be in a read-only state even if its read-only attribute is not set, if the underlying hardware is read-only. For example, if the LUN is in read-only state, or if the disk is a virtual hard disk that resides on a volume that is read-only, the underlying hardware is read-only, and therefore the disk is in a read-only state.<b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DF_CURRENT_READ_ONLY => 32768

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDS_DF_REFS_NOT_SUPPORTED => 65536
}
