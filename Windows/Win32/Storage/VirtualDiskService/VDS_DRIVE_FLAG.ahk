#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid flags for a drive object.
 * @remarks
 * 
  * This enumeration provides the values for the <i>ulFlags</i> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop">VDS_DRIVE_PROP</a>structure.
  * 
  * This enumeration provides the values for the <i>ulFlags</i> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop">VDS_DRIVE_PROP</a>structure.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_DRIVE_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_DRIVE_FLAG</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_drive_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DRIVE_FLAG{

    /**
     * The drive is reserved for use only as a hot spare.
     * @type {Integer (Int32)}
     */
    static VDS_DRF_HOTSPARE => 1

    /**
     * The drive is assigned to a RAID group or <a href="https://docs.microsoft.com/windows/desktop/VDS/storage-pool-object">storage pool</a>.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DRF_ASSIGNED => 2

    /**
     * The drive is not assigned to a RAID group or storage pool.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DRF_UNASSIGNED => 4

    /**
     * The drive is in use as a hot spare.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DRF_HOTSPARE_IN_USE => 8

    /**
     * The drive is on standby as a hot spare.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_DRF_HOTSPARE_STANDBY => 16
}
