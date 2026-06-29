#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NET_RESOURCE_TYPE {
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
    static RESOURCETYPE_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCETYPE_DISK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCETYPE_PRINT => 2
}
