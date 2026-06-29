#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIMESTAMP_RESPONSE_STATUS {
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
    static TIMESTAMP_STATUS_GRANTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_GRANTED_WITH_MODS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_REJECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_WAITING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_REVOCATION_WARNING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_REVOKED => 5
}
