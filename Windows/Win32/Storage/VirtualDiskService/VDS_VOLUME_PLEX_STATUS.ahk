#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of object status values for a volume plex.
 * @remarks
 * 
  * The  <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_plex_prop">VDS_VOLUME_PLEX_PROP</a>structure includes a <b>VDS_VOLUME_PLEX_STATUS</b> value as a member to indicate the status of a volume plex.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_VOLUME_PLEX_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_VOLUME_PLEX_STATUS</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_volume_plex_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VOLUME_PLEX_STATUS{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_VPS_UNKNOWN => 0

    /**
     * The volume plex is available.
     * @type {Integer (Int32)}
     */
    static VDS_VPS_ONLINE => 1

    /**
     * The volume plex has no media.
     * @type {Integer (Int32)}
     */
    static VDS_VPS_NO_MEDIA => 3

    /**
     * The volume plex is unavailable.
     * @type {Integer (Int32)}
     */
    static VDS_VPS_FAILED => 5
}
