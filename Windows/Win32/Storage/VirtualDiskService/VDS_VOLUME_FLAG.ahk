#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid flags for a volume object.
 * @remarks
 * On an MBR basic disk, volume flags can be set only for the entire disk, not for individual volumes.
  * 
  * If the <b>VDS_VF_NO_DEFAULT_DRIVE_LETTER</b> flag is set on an MBR disk, any existing drive letters are preserved, but no new drive letters will be assigned to volumes on the disk.
  * 
  * This enumeration provides values for the <b>ulFlags</b> member of the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a> structure and the <i>ulFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-setflags">IVdsVolume::SetFlags</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-clearflags">IVdsVolume::ClearFlags</a> methods.
  * 
  * The following table compares the behavior of the VDS_VF_NO_DEFAULT_DRIVE_LETTER flag on MBR basic disks, GPT basic disks, and dynamic disks.
  * 
  * <table>
  * <tr>
  * <th>Feature</th>
  * <th>MBR basic disks</th>
  * <th>GPT basic disks</th>
  * <th>MBR or GPT dynamic disks</th>
  * </tr>
  * <tr>
  * <td>The VDS_VF_NO_DEFAULT_DRIVE_LETTER flag is cleared by default. However, this flag can be set by calling <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-setflags">IVdsVolume::SetFlags</a>.</td>
  * <td>Yes.</td>
  * <td>Yes.</td>
  * <td>Yes.<b>Windows Server 2003:  </b>This flag is always set for dynamic disks and cannot be cleared.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>Assigning or removing a drive letter toggles the VDS_VF_NO_DEFAULT_DRIVE_LETTER flag setting.</td>
  * <td>No, because this flag is set or cleared for the entire disk.</td>
  * <td>Yes, because this flag is set or cleared for individual volumes.</td>
  * <td>Yes.<b>Windows Server 2003:  </b>This flag is always set for dynamic disks and cannot be cleared.
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * To create a boot volume on a dynamic disk, you must set the <b>VDS_VF_INSTALLABLE</b> flag for the volume and then format the volume by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-format">IVdsVolumeMF::Format</a> method.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_VOLUME_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_VOLUME_FLAG</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_volume_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VOLUME_FLAG{

    /**
     * The volume is a system volume.
     * @type {Integer (Int32)}
     */
    static VDS_VF_SYSTEM_VOLUME => 1

    /**
     * The volume is the boot volume.
     * @type {Integer (Int32)}
     */
    static VDS_VF_BOOT_VOLUME => 2

    /**
     * The volume is active. That is, the <i>bootIndicator</i> value of the 
 *       underlying partition is set to true.
     * @type {Integer (Int32)}
     */
    static VDS_VF_ACTIVE => 4

    /**
     * The volume has a drive letter and a Mount Manager–assigned volume GUID name, and is enumerated by the <b>FindFirstVolume</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextvolumew">FindNextVolume</a> functions. However, the volume is read-only. This flag does not apply to CD-ROM or DVD devices.
     * @type {Integer (Int32)}
     */
    static VDS_VF_READONLY => 8

    /**
     * The volume does not have a drive letter and a Mount Manager–assigned volume GUID name. The volume is not enumerated by the <b>FindFirstVolume</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextvolumew">FindNextVolume</a> functions. The volume can be opened by using its device name, and the opened volume can be read from or written to. An example of a volume device name is \\?\GLOBALROOT\Device\HarddiskVolumeX. This flag does not apply to CD-ROM or DVD devices.
     * @type {Integer (Int32)}
     */
    static VDS_VF_HIDDEN => 16

    /**
     * The volume size can be extended.
     * @type {Integer (Int32)}
     */
    static VDS_VF_CAN_EXTEND => 32

    /**
     * The volume size can be reduced.
     * @type {Integer (Int32)}
     */
    static VDS_VF_CAN_SHRINK => 64

    /**
     * The volume contains a pagefile.
     * @type {Integer (Int32)}
     */
    static VDS_VF_PAGEFILE => 128

    /**
     * The volume contains a hibernation file.
     * @type {Integer (Int32)}
     */
    static VDS_VF_HIBERNATION => 256

    /**
     * The volume contains the crash dump file.
     * @type {Integer (Int32)}
     */
    static VDS_VF_CRASHDUMP => 512

    /**
     * VDS creates a hard partition under a dynamic volume that callers can use to install an operating system. Clearing this flag causes the partition to be deleted. This flag can be set or cleared only for dynamic disks; it is always set for basic disks. This flag does not apply to CD-ROM or DVD devices.
     * @type {Integer (Int32)}
     */
    static VDS_VF_INSTALLABLE => 1024

    /**
     * VDS can change the position of the volume on the disk dynamically. This flag is not valid for basic 
 *       or dynamic volumes and is supported only by some third-party volume managers.
     * @type {Integer (Int32)}
     */
    static VDS_VF_LBN_REMAP_ENABLED => 2048

    /**
     * The volume is being formatted.
     * @type {Integer (Int32)}
     */
    static VDS_VF_FORMATTING => 4096

    /**
     * The volume cannot be formatted. This flag applies to small portable memory devices, removable 
 *       devices, CDROM devices, and DVD devices. For CD and DVD devices, this is always set when there is media in the 
 *       drive, and is not set if there is no media in the drive.
     * @type {Integer (Int32)}
     */
    static VDS_VF_NOT_FORMATTABLE => 8192

    /**
     * The volume does not support NTFS, but can support other file systems. This flag applies to small 
 *       portable memory devices, removable devices, CDROM devices, and DVD devices.
     * @type {Integer (Int32)}
     */
    static VDS_VF_NTFS_NOT_SUPPORTED => 16384

    /**
     * The volume does not support FAT32. This flag applies to small portable memory devices, removable 
 *       devices, CDROM devices, and DVD devices.
     * @type {Integer (Int32)}
     */
    static VDS_VF_FAT32_NOT_SUPPORTED => 32768

    /**
     * The volume does not support FAT. This flag applies to small portable memory devices, removable 
 *       devices, CDROM devices, and DVD devices.
     * @type {Integer (Int32)}
     */
    static VDS_VF_FAT_NOT_SUPPORTED => 65536

    /**
     * The operating system does not assign a drive letter automatically the next time the volume is added to the computer. 
 *       If cleared, the operating system assigns a drive letter to the volume under some conditions. For basic GPT 
 *       volumes, assigning or removing a drive letter will toggle this flag. This flag does not apply to CD-ROM or DVD devices.
 * 
 * <b>Windows Server 2003:  </b>On dynamic volumes, this flag is always set and cannot be cleared. On basic volumes, it is cleared by default and can be set or cleared only by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-setflags">IVdsVolume::SetFlags</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-clearflags">IVdsVolume::ClearFlags</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_VF_NO_DEFAULT_DRIVE_LETTER => 131072

    /**
     * The volume is offline. Volume open will succeed on an offline volume. However, I/O against an offline volume will fail. Assigning an access path, such as a drive letter, to an offline volume causes it to become online. To set this flag, call the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-dismount">IVdsVolumeMF::Dismount</a> 
 *       method, setting the <i>bForce</i> and <i>bPermanent</i> parameters to 
 *       <b>TRUE</b>. This flag does not apply to CD-ROM or DVD devices.
 * 
 * <b>Windows Server 2003:  </b>Offlining dynamic volumes is not supported.
 * 
 * When a volume is offline, this flag is set in the <b>ulFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a> structure, and the <b>VDS_VS_OFFLINE</b> flag is also set in the <b>status</b> member of the <b>VDS_VOLUME_PROP</b> or <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop2">VDS_VOLUME_PROP2</a> structure.<b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>The <b>VDS_VS_OFFLINE</b> flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_VF_PERMANENTLY_DISMOUNTED => 262144

    /**
     * The volume can be taken offline.
     * @type {Integer (Int32)}
     */
    static VDS_VF_PERMANENT_DISMOUNT_SUPPORTED => 524288

    /**
     * The volume is a shadow copy of another volume. This flag is set when the shadow copy is created. It is 
 *       cleared when the shadow copy is broken from the original volume. The <b>VDS_VF_SHADOW_COPY</b> 
 *       flag is an indication for file system filter driver-based software (such as 
 *           antivirus programs) to avoid attaching to the 
 *       volume. The attribute can be used by applications to differentiate shadow copy volumes from production volumes. Applications that 
 *       perform a Fast Recovery where a shadow copy LUN is made into a non-shadow copy by clearing the read-only and hidden 
 *       bit will need to clear this bit as well. This flag does not apply to CD-ROM or DVD devices.
 *       
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 with SP1.
     * @type {Integer (Int32)}
     */
    static VDS_VF_SHADOW_COPY => 1048576

    /**
     * The volume is protected by BitLocker full-volume encryption. This flag does not apply to CD-ROM or DVD devices.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_VF_FVE_ENABLED => 2097152

    /**
     * The volume's dirty bit is set.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_VF_DIRTY => 4194304

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDS_VF_REFS_NOT_SUPPORTED => 8388608

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDS_VF_BACKS_BOOT_VOLUME => 16777216

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDS_VF_BACKED_BY_WIM_IMAGE => 33554432
}
