#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of object status values for a LUN.
 * @remarks
 * 
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-setstatus">IVdsLun::SetStatus</a>method passes a <b>VDS_LUN_STATUS</b> value as an argument to set the status of a LUN, and the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_prop">VDS_LUN_PROP</a> structure includes a <b>VDS_LUN_STATUS</b> value as a member to indicate the current status.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_lun_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_STATUS{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LS_UNKNOWN => 0

    /**
     * The LUN is available.
     * @type {Integer (Int32)}
     */
    static VDS_LS_ONLINE => 1

    /**
     * The LUN is busy.
     * @type {Integer (Int32)}
     */
    static VDS_LS_NOT_READY => 2

    /**
     * The LUN is unavailable.
     * @type {Integer (Int32)}
     */
    static VDS_LS_OFFLINE => 4

    /**
     * The LUN has failed.
     * @type {Integer (Int32)}
     */
    static VDS_LS_FAILED => 5
}
