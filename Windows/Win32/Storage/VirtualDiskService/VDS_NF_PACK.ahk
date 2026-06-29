#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_NF_PACK {
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
    static VDS_NF_PACK_ARRIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PACK_DEPART => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_PACK_MODIFY => 3
}
