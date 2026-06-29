#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VDS_ISCSI_LOGIN_TYPE enumeration (vdshwprv.h) defines the set of valid types for logging into an iSCSI target.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ISCSI_LOGIN_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ISCSI_LOGIN_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_iscsi_login_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_LOGIN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A manual, one-time login is performed.
     * @type {Integer (Int32)}
     */
    static VDS_ILT_MANUAL => 0

    /**
     * A persistent login is performed.
     * @type {Integer (Int32)}
     */
    static VDS_ILT_PERSISTENT => 1

    /**
     * A persistent login is performed such that the target is present at startup.
     * @type {Integer (Int32)}
     */
    static VDS_ILT_BOOT => 2
}
