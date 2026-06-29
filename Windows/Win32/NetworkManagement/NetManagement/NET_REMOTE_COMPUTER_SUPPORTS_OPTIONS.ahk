#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS {
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
    static SUPPORTS_REMOTE_ADMIN_PROTOCOL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_RPC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_SAM_PROTOCOL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_UNICODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_LOCAL => 32
}
