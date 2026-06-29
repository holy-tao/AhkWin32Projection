#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_NF_DISK {
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
    static VDS_NF_DISK_ARRIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DISK_DEPART => 9

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DISK_MODIFY => 10
}
