#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPSTATS_FORWARDING {
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
    static MIB_IP_FORWARDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IP_NOT_FORWARDING => 2
}
