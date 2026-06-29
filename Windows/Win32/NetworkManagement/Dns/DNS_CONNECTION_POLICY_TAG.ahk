#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_POLICY_TAG {
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
    static TAG_DNS_CONNECTION_POLICY_TAG_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TAG_DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER => 1

    /**
     * @type {Integer (Int32)}
     */
    static TAG_DNS_CONNECTION_POLICY_TAG_WWWPT => 2
}
