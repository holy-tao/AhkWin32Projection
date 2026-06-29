#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VDS_ISCSI_PORTAL_STATUS enumeration (vdshwprv.h) defines the set of valid status values for an iSCSI portal.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ISCSI_PORTAL_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ISCSI_PORTAL_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_iscsi_portal_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_PORTAL_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The status is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_IPS_UNKNOWN => 0

    /**
     * The portal is available.
     * @type {Integer (Int32)}
     */
    static VDS_IPS_ONLINE => 1

    /**
     * The portal is busy.
     * @type {Integer (Int32)}
     */
    static VDS_IPS_NOT_READY => 2

    /**
     * The portal is unavailable.
     * @type {Integer (Int32)}
     */
    static VDS_IPS_OFFLINE => 4

    /**
     * The portal has failed.
     * @type {Integer (Int32)}
     */
    static VDS_IPS_FAILED => 5
}
