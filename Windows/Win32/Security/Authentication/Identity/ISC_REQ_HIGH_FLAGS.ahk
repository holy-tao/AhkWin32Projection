#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct ISC_REQ_HIGH_FLAGS {
    value : Int64

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_MESSAGES => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_DEFERRED_CRED_VALIDATION => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_NO_POST_HANDSHAKE_AUTH => 17179869184

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_REUSE_SESSION_TICKETS => 34359738368

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_EXPLICIT_SESSION => 68719476736
}
