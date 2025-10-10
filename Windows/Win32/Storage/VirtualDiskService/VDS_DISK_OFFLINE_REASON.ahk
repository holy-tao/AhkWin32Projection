#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of reasons for a disk to be offline.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_disk_offline_reason
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DISK_OFFLINE_REASON{

    /**
     * The reason is unknown.
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonNone => 0

    /**
     * The disk is offline because of the current <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">SAN policy</a>.
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonPolicy => 1

    /**
     * The disk is offline because it has a path that is the same as that of another device. This value is used when multipathing is physically enabled, but the MPIO software is not installed or is not functioning properly. (When the MPIO software is functioning properly, it exposes only one disk device.)
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonRedundantPath => 2

    /**
     * The disk is offline because it contains a volume shadow copy volume. In this case, the disk is a clone of another disk that is online.
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonSnapshot => 3

    /**
     * If the disk is an MBR disk, it is offline because its disk signature is the same as that of another disk that is online. The disk signature is found in the <b>dwSignature</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop2">VDS_DISK_PROP2</a> structures and in the <b>Signature</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-drive_layout_information_mbr">DRIVE_LAYOUT_INFORMATION_MBR</a> structure.
 * 
 * If it is a GPT disk, it is offline for one of the following reasons:<ul>
 * <li>Its disk identifier is the same as that of another disk that is offline. The disk identifier is found in the <b>DiskGuid</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop2">VDS_DISK_PROP2</a> structures and in the <b>DiskId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-drive_layout_information_gpt">DRIVE_LAYOUT_INFORMATION_GPT</a> structure.</li>
 * <li>One of the partitions has the same partition GUID as another partition on the same disk.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonCollision => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonResourceExhaustion => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonWriteFailure => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonDIScan => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDSDiskOfflineReasonLostDataPersistence => 8
}
