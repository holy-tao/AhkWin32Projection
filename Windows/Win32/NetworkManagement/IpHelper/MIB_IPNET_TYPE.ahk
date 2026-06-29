#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPNET_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPNET_TYPE_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPNET_TYPE_INVALID => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPNET_TYPE_DYNAMIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPNET_TYPE_STATIC => 4
}
