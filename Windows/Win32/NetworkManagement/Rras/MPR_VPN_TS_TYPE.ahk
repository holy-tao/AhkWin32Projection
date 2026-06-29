#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_VPN_TS_TYPE {
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
    static MPR_VPN_TS_IPv4_ADDR_RANGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static MPR_VPN_TS_IPv6_ADDR_RANGE => 8
}
