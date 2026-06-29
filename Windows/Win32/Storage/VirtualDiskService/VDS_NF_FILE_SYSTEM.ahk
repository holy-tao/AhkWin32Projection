#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_NF_FILE_SYSTEM {
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
    static VDS_NF_FILE_SYSTEM_MODIFY => 203

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_FILE_SYSTEM_FORMAT_PROGRESS => 204
}
