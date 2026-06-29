#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VDS_RECOVER_ACTION enumeration (vdshwprv.h) is reserved for system use.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_RECOVER_ACTION</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_RECOVER_ACTION</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_recover_action
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_RECOVER_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static VDS_RA_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static VDS_RA_REFRESH => 1

    /**
     * @type {Integer (Int32)}
     */
    static VDS_RA_RESTART => 2
}
