#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid status values for a port.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PATH_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PATH_STATUS</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_path_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PATH_STATUS{

    /**
     * The path status is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_MPS_UNKNOWN => 0

    /**
     * The path is active.
     * @type {Integer (Int32)}
     */
    static VDS_MPS_ONLINE => 1

    /**
     * The path is failed.
     * @type {Integer (Int32)}
     */
    static VDS_MPS_FAILED => 5

    /**
     * The path is in standby mode.
     * @type {Integer (Int32)}
     */
    static VDS_MPS_STANDBY => 7
}
