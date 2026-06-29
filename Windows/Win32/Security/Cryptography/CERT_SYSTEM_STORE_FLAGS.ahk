#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SYSTEM_STORE_FLAGS {
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
    static CERT_SYSTEM_STORE_LOCATION_MASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SYSTEM_STORE_RELOCATE_FLAG => 2147483648
}
