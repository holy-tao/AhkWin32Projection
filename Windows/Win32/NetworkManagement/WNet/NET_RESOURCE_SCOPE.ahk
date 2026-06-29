#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NET_RESOURCE_SCOPE {
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
    static RESOURCE_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_CONTEXT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_GLOBALNET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_REMEMBERED => 3
}
