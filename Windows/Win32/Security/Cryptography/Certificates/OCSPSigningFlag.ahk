#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class OCSPSigningFlag extends Win32Enum {

    /**
     * Native name: OCSP_SF_SILENT
     * @type {Integer (Int32)}
     */
    static SF_SILENT => 1

    /**
     * Native name: OCSP_SF_USE_CACERT
     * @type {Integer (Int32)}
     */
    static SF_USE_CACERT => 2

    /**
     * Native name: OCSP_SF_ALLOW_SIGNINGCERT_AUTORENEWAL
     * @type {Integer (Int32)}
     */
    static SF_ALLOW_SIGNINGCERT_AUTORENEWAL => 4

    /**
     * Native name: OCSP_SF_FORCE_SIGNINGCERT_ISSUER_ISCA
     * @type {Integer (Int32)}
     */
    static SF_FORCE_SIGNINGCERT_ISSUER_ISCA => 8

    /**
     * Native name: OCSP_SF_AUTODISCOVER_SIGNINGCERT
     * @type {Integer (Int32)}
     */
    static SF_AUTODISCOVER_SIGNINGCERT => 16

    /**
     * Native name: OCSP_SF_MANUAL_ASSIGN_SIGNINGCERT
     * @type {Integer (Int32)}
     */
    static SF_MANUAL_ASSIGN_SIGNINGCERT => 32

    /**
     * Native name: OCSP_SF_RESPONDER_ID_KEYHASH
     * @type {Integer (Int32)}
     */
    static SF_RESPONDER_ID_KEYHASH => 64

    /**
     * Native name: OCSP_SF_RESPONDER_ID_NAME
     * @type {Integer (Int32)}
     */
    static SF_RESPONDER_ID_NAME => 128

    /**
     * Native name: OCSP_SF_ALLOW_NONCE_EXTENSION
     * @type {Integer (Int32)}
     */
    static SF_ALLOW_NONCE_EXTENSION => 256

    /**
     * Native name: OCSP_SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT
     * @type {Integer (Int32)}
     */
    static SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT => 512
}
