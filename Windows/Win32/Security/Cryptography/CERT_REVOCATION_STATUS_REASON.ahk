#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REVOCATION_STATUS_REASON {
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
    static CRL_REASON_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRL_REASON_KEY_COMPROMISE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRL_REASON_CA_COMPROMISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRL_REASON_AFFILIATION_CHANGED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRL_REASON_SUPERSEDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRL_REASON_CESSATION_OF_OPERATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRL_REASON_CERTIFICATE_HOLD => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRL_REASON_REMOVE_FROM_CRL => 8
}
