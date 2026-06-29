#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NET_USER_ENUM_FILTER_FLAGS {
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
    static FILTER_TEMP_DUPLICATE_ACCOUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_NORMAL_ACCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_INTERDOMAIN_TRUST_ACCOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_WORKSTATION_TRUST_ACCOUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_SERVER_TRUST_ACCOUNT => 32
}
