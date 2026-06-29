#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CRED_PACK_FLAGS {
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
    static CRED_PACK_PROTECTED_CREDENTIALS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PACK_WOW_BUFFER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PACK_GENERIC_CREDENTIALS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PACK_ID_PROVIDER_CREDENTIALS => 8
}
