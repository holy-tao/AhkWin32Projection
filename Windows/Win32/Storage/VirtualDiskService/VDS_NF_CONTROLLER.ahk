#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_NF_CONTROLLER {
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
    static VDS_NF_CONTROLLER_ARRIVE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_DEPART => 104

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_MODIFY => 350

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_REMOVED => 351
}
