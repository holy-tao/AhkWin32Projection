#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_ADDRESS_TYPE {
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
    static DS_INET_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_NETBIOS_ADDRESS => 2
}
