#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_NF_DRIVE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_ARRIVE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_DEPART => 106

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_MODIFY => 107

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_REMOVED => 354
}
