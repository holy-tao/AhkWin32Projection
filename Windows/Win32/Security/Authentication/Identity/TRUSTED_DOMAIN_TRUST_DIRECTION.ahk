#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_TRUST_DIRECTION {
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
    static TRUST_DIRECTION_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_DIRECTION_INBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_DIRECTION_OUTBOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_DIRECTION_BIDIRECTIONAL => 3
}
