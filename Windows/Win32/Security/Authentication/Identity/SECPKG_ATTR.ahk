#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SECPKG_ATTR extends Win32Enum {

    /**
     * Native name: SECPKG_ATTR_C_ACCESS_TOKEN
     * @type {Integer (UInt32)}
     */
    static C_ACCESS_TOKEN => 2147483666

    /**
     * Native name: SECPKG_ATTR_C_FULL_ACCESS_TOKEN
     * @type {Integer (UInt32)}
     */
    static C_FULL_ACCESS_TOKEN => 2147483778

    /**
     * Native name: SECPKG_ATTR_CERT_TRUST_STATUS
     * @type {Integer (UInt32)}
     */
    static CERT_TRUST_STATUS => 2147483780

    /**
     * Native name: SECPKG_ATTR_CREDS
     * @type {Integer (UInt32)}
     */
    static CREDS => 2147483776

    /**
     * Native name: SECPKG_ATTR_CREDS_2
     * @type {Integer (UInt32)}
     */
    static CREDS_2 => 2147483782

    /**
     * Native name: SECPKG_ATTR_NEGOTIATION_PACKAGE
     * @type {Integer (UInt32)}
     */
    static NEGOTIATION_PACKAGE => 2147483777

    /**
     * Native name: SECPKG_ATTR_PACKAGE_INFO
     * @type {Integer (UInt32)}
     */
    static PACKAGE_INFO => 10

    /**
     * Native name: SECPKG_ATTR_SERVER_AUTH_FLAGS
     * @type {Integer (UInt32)}
     */
    static SERVER_AUTH_FLAGS => 2147483779

    /**
     * Native name: SECPKG_ATTR_SIZES
     * @type {Integer (UInt32)}
     */
    static SIZES => 0

    /**
     * Native name: SECPKG_ATTR_SUBJECT_SECURITY_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static SUBJECT_SECURITY_ATTRIBUTES => 124

    /**
     * Native name: SECPKG_ATTR_APP_DATA
     * @type {Integer (UInt32)}
     */
    static APP_DATA => 94

    /**
     * Native name: SECPKG_ATTR_EAP_PRF_INFO
     * @type {Integer (UInt32)}
     */
    static EAP_PRF_INFO => 101

    /**
     * Native name: SECPKG_ATTR_EARLY_START
     * @type {Integer (UInt32)}
     */
    static EARLY_START => 105

    /**
     * Native name: SECPKG_ATTR_DTLS_MTU
     * @type {Integer (UInt32)}
     */
    static DTLS_MTU => 34

    /**
     * Native name: SECPKG_ATTR_KEYING_MATERIAL_INFO
     * @type {Integer (UInt32)}
     */
    static KEYING_MATERIAL_INFO => 106

    /**
     * Native name: SECPKG_ATTR_ACCESS_TOKEN
     * @type {Integer (UInt32)}
     */
    static ACCESS_TOKEN => 18

    /**
     * Native name: SECPKG_ATTR_AUTHORITY
     * @type {Integer (UInt32)}
     */
    static AUTHORITY => 6

    /**
     * Native name: SECPKG_ATTR_CLIENT_SPECIFIED_TARGET
     * @type {Integer (UInt32)}
     */
    static CLIENT_SPECIFIED_TARGET => 27

    /**
     * Native name: SECPKG_ATTR_CONNECTION_INFO
     * @type {Integer (UInt32)}
     */
    static CONNECTION_INFO => 90

    /**
     * Native name: SECPKG_ATTR_DCE_INFO
     * @type {Integer (UInt32)}
     */
    static DCE_INFO => 3

    /**
     * Native name: SECPKG_ATTR_ENDPOINT_BINDINGS
     * @type {Integer (UInt32)}
     */
    static ENDPOINT_BINDINGS => 26

    /**
     * Native name: SECPKG_ATTR_EAP_KEY_BLOCK
     * @type {Integer (UInt32)}
     */
    static EAP_KEY_BLOCK => 91

    /**
     * Native name: SECPKG_ATTR_FLAGS
     * @type {Integer (UInt32)}
     */
    static FLAGS => 14

    /**
     * Native name: SECPKG_ATTR_ISSUER_LIST_EX
     * @type {Integer (UInt32)}
     */
    static ISSUER_LIST_EX => 89

    /**
     * Native name: SECPKG_ATTR_KEY_INFO
     * @type {Integer (UInt32)}
     */
    static KEY_INFO => 5

    /**
     * Native name: SECPKG_ATTR_LAST_CLIENT_TOKEN_STATUS
     * @type {Integer (UInt32)}
     */
    static LAST_CLIENT_TOKEN_STATUS => 30

    /**
     * Native name: SECPKG_ATTR_LIFESPAN
     * @type {Integer (UInt32)}
     */
    static LIFESPAN => 2

    /**
     * Native name: SECPKG_ATTR_LOCAL_CERT_CONTEXT
     * @type {Integer (UInt32)}
     */
    static LOCAL_CERT_CONTEXT => 84

    /**
     * Native name: SECPKG_ATTR_LOCAL_CRED
     * @type {Integer (UInt32)}
     */
    static LOCAL_CRED => 82

    /**
     * Native name: SECPKG_ATTR_NAMES
     * @type {Integer (UInt32)}
     */
    static NAMES => 1

    /**
     * Native name: SECPKG_ATTR_NATIVE_NAMES
     * @type {Integer (UInt32)}
     */
    static NATIVE_NAMES => 13

    /**
     * Native name: SECPKG_ATTR_NEGOTIATION_INFO
     * @type {Integer (UInt32)}
     */
    static NEGOTIATION_INFO => 12

    /**
     * Native name: SECPKG_ATTR_PASSWORD_EXPIRY
     * @type {Integer (UInt32)}
     */
    static PASSWORD_EXPIRY => 8

    /**
     * Native name: SECPKG_ATTR_REMOTE_CERT_CONTEXT
     * @type {Integer (UInt32)}
     */
    static REMOTE_CERT_CONTEXT => 83

    /**
     * Native name: SECPKG_ATTR_ROOT_STORE
     * @type {Integer (UInt32)}
     */
    static ROOT_STORE => 85

    /**
     * Native name: SECPKG_ATTR_SESSION_KEY
     * @type {Integer (UInt32)}
     */
    static SESSION_KEY => 9

    /**
     * Native name: SECPKG_ATTR_SESSION_INFO
     * @type {Integer (UInt32)}
     */
    static SESSION_INFO => 93

    /**
     * Native name: SECPKG_ATTR_STREAM_SIZES
     * @type {Integer (UInt32)}
     */
    static STREAM_SIZES => 4

    /**
     * Native name: SECPKG_ATTR_SUPPORTED_SIGNATURES
     * @type {Integer (UInt32)}
     */
    static SUPPORTED_SIGNATURES => 102

    /**
     * Native name: SECPKG_ATTR_TARGET_INFORMATION
     * @type {Integer (UInt32)}
     */
    static TARGET_INFORMATION => 17

    /**
     * Native name: SECPKG_ATTR_UNIQUE_BINDINGS
     * @type {Integer (UInt32)}
     */
    static UNIQUE_BINDINGS => 25
}
