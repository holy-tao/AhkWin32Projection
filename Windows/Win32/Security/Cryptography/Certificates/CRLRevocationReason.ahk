#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CRLRevocationReason{

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_KEY_COMPROMISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_CA_COMPROMISE => 2

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_AFFILIATION_CHANGED => 3

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_SUPERSEDED => 4

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_CESSATION_OF_OPERATION => 5

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_CERTIFICATE_HOLD => 6

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_REMOVE_FROM_CRL => 8

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_PRIVILEGE_WITHDRAWN => 9

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRL_REASON_AA_COMPROMISE => 10
}
