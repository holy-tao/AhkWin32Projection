#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_LUN_STATUS enumeration (vdshwprv.h) defines the set of object status values for a LUN.
 * @remarks
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-setstatus">IVdsLun::SetStatus</a> method passes a <b>VDS_LUN_STATUS</b> value as an argument to set the status of a LUN, and the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_prop">VDS_LUN_PROP</a> structure includes a <b>VDS_LUN_STATUS</b> value as a member to indicate the current status.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_lun_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_LUN_STATUS extends Win32Enum {

    /**
     * This value is reserved.
     * Native name: VDS_LS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static LS_UNKNOWN => 0

    /**
     * The LUN is available.
     * Native name: VDS_LS_ONLINE
     * @type {Integer (Int32)}
     */
    static LS_ONLINE => 1

    /**
     * The LUN is busy.
     * Native name: VDS_LS_NOT_READY
     * @type {Integer (Int32)}
     */
    static LS_NOT_READY => 2

    /**
     * The LUN is unavailable.
     * Native name: VDS_LS_OFFLINE
     * @type {Integer (Int32)}
     */
    static LS_OFFLINE => 4

    /**
     * The LUN has failed.
     * Native name: VDS_LS_FAILED
     * @type {Integer (Int32)}
     */
    static LS_FAILED => 5
}
