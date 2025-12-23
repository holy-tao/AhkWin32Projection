#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of object status values for a disk.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> structure includes a <b>VDS_DISK_STATUS</b> value as a member to indicate the current status of a disk.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_DISK_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_DISK_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_disk_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DISK_STATUS extends Win32Enum{

    /**
     * The provider failed to get the disk properties from the driver (unknown status, unknown health), or the provider cannot access the disk (unknown status, healthy).
     * @type {Integer (Int32)}
     */
    static VDS_DS_UNKNOWN => 0

    /**
     * The disk is available. The disk status value can be VDS_DS_ONLINE, even if the status of the containing pack is VDS_PS_OFFLINE.
     * @type {Integer (Int32)}
     */
    static VDS_DS_ONLINE => 1

    /**
     * The disk is currently not ready to use. For example, if you use ACPI Power Management to request that a disk hibernate (spin down), the disk becomes temporarily unavailable.
     * @type {Integer (Int32)}
     */
    static VDS_DS_NOT_READY => 2

    /**
     * The disk is removable media, such as a CD-ROM drive, or contains no media.
     * @type {Integer (Int32)}
     */
    static VDS_DS_NO_MEDIA => 3

    /**
     * The disk is unavailable and cannot be used.
     * @type {Integer (Int32)}
     */
    static VDS_DS_FAILED => 5

    /**
     * No physical device is present for the disk object, even though the pack configuration information lists the disk. This status value applies to dynamic disks only.
     * @type {Integer (Int32)}
     */
    static VDS_DS_MISSING => 6

    /**
     * The disk is offline.
     * 
     * <b>Windows Vista and Windows Server 2003:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DS_OFFLINE => 4
}
