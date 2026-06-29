#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct PROXY_AUTO_DETECT_TYPE {
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
    static PROXY_AUTO_DETECT_TYPE_DHCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_AUTO_DETECT_TYPE_DNS_A => 2
}
