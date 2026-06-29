#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VDS_PATH_STATUS enumeration (vdshwprv.h) defines the set of valid status values for a port.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PATH_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PATH_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_path_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PATH_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
