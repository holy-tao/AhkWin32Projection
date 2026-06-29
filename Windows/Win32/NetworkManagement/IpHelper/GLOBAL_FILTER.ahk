#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct GLOBAL_FILTER {
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
    static GF_FRAGMENTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static GF_STRONGHOST => 8

    /**
     * @type {Integer (Int32)}
     */
    static GF_FRAGCACHE => 9
}
