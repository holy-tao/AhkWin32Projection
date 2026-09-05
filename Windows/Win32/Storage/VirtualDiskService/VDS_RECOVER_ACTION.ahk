#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_RECOVER_ACTION enumeration (vdshwprv.h) is reserved for system use.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_RECOVER_ACTION</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_RECOVER_ACTION</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_recover_action
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_RECOVER_ACTION extends Win32Enum {

    /**
     * Native name: VDS_RA_UNKNOWN
     * @type {Integer (Int32)}
     */
    static RA_UNKNOWN => 0

    /**
     * Native name: VDS_RA_REFRESH
     * @type {Integer (Int32)}
     */
    static RA_REFRESH => 1

    /**
     * Native name: VDS_RA_RESTART
     * @type {Integer (Int32)}
     */
    static RA_RESTART => 2
}
