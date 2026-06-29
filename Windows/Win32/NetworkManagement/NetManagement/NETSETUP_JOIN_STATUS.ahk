#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NETSETUP_JOIN_STATUS {
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
    static NetSetupUnknownStatus => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupUnjoined => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupWorkgroupName => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupDomainName => 3
}
