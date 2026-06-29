#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Not supported.This enumeration is reserved for future use. (VDS_LUN_RESERVE_MODE)
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_LUN_RESERVE_MODE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_LUN_RESERVE_MODE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_lun_reserve_mode
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_LUN_RESERVE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_NONE => 0

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_EXCLUSIVE_RW => 1

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_EXCLUSIVE_RO => 2

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_SHARED_RO => 3

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_LRM_SHARED_RW => 4
}
