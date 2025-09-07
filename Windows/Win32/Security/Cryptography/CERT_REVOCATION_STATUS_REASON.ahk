#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REVOCATION_STATUS_REASON{

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
