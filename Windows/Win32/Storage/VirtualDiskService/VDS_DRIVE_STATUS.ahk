#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of object status values for a drive.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive-setstatus">IVdsDrive::SetStatus</a>method passes a <b>VDS_DRIVE_STATUS</b> value as an argument to set the status of a drive, and  the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop">VDS_DRIVE_PROP</a> structure includes a <b>VDS_DRIVE_STATUS</b> value as a member to indicate the current status.
  * 
  * If your application encounters a <b>VDS_DRIVE_STATUS</b> value that it does not recognize, it should display the drive status as unknown. It should not attempt to map the unrecognized drive status to another drive status.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_DRIVE_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_DRIVE_STATUS</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_drive_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DRIVE_STATUS{

    /**
     * The status of the drive cannot be determined.
     * @type {Integer (Int32)}
     */
    static VDS_DRS_UNKNOWN => 0

    /**
     * The drive is available and in use. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value associated with this drive status can be any value except <b>VDS_H_FAILED</b>.
     * @type {Integer (Int32)}
     */
    static VDS_DRS_ONLINE => 1

    /**
     * The drive is busy. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value can be any value except <b>VDS_H_FAILED</b>.
     * @type {Integer (Int32)}
     */
    static VDS_DRS_NOT_READY => 2

    /**
     * The drive is physically present but has been removed from its RAID group or storage pool. For example, if the drive was removed from its RAID group because it failed, the  drive status should be <b>VDS_DRS_FAILED</b>. If the drive was removed as part of rebalancing storage, the drive status should be <b>VDS_DRS_OFFLINE</b>. 
 * 
 * When this drive status is set, a <b>VDS_NF_DRIVE_REMOVED</b> notification is sent.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value can be any value.
     * @type {Integer (Int32)}
     */
    static VDS_DRS_OFFLINE => 4

    /**
     * The drive has failed. The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> value should be <b>VDS_H_FAILED</b> or <b>VDS_H_FAILING</b>.
     * @type {Integer (Int32)}
     */
    static VDS_DRS_FAILED => 5

    /**
     * The drive has been physically unplugged from the subsystem. When this status is set, a <b>VDS_NF_DRIVE_DEPART</b> notification is sent.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DRS_REMOVED => 8
}
