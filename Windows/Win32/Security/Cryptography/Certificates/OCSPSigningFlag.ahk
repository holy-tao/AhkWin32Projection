#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class OCSPSigningFlag{

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_SILENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_USE_CACERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_ALLOW_SIGNINGCERT_AUTORENEWAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_FORCE_SIGNINGCERT_ISSUER_ISCA => 8

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_AUTODISCOVER_SIGNINGCERT => 16

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_MANUAL_ASSIGN_SIGNINGCERT => 32

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_RESPONDER_ID_KEYHASH => 64

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_RESPONDER_ID_NAME => 128

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_ALLOW_NONCE_EXTENSION => 256

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT => 512
}
