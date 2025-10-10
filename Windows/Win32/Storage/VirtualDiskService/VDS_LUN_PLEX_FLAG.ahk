#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid flags for a LUN plex object.
 * @remarks
 * 
  * This enumeration provides the value for the <b>ulFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_plex_prop">VDS_LUN_PLEX_PROP</a> structure.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_PLEX_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_PLEX_FLAG</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_lun_plex_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_PLEX_FLAG{

    /**
     * If set, the provider remaps LUN extents to drive extents automatically. This flag corresponds to the <b>VDS_LF_LBN_REMAP_ENABLED</b> value of   the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_LPF_LBN_REMAP_ENABLED => 1
}
