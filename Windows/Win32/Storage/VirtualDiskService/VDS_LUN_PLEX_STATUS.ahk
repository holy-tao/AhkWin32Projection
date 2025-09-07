#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_LUN_PLEX_STATUS enumeration (vdshwprv.h) defines the set of object status values for a LUN plex.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_plex_prop">VDS_LUN_PLEX_PROP</a> structure includes a <b>VDS_LUN_PLEX_STATUS</b> value as a member to indicate the current status of the LUN plex.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_PLEX_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_PLEX_STATUS</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_lun_plex_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_PLEX_STATUS{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LPS_UNKNOWN => 0

    /**
     * The plex is available.
     * @type {Integer (Int32)}
     */
    static VDS_LPS_ONLINE => 1

    /**
     * The plex is busy.
     * @type {Integer (Int32)}
     */
    static VDS_LPS_NOT_READY => 2

    /**
     * The plex is unavailable.
     * @type {Integer (Int32)}
     */
    static VDS_LPS_OFFLINE => 4

    /**
     * The plex has failed.
     * @type {Integer (Int32)}
     */
    static VDS_LPS_FAILED => 5
}
