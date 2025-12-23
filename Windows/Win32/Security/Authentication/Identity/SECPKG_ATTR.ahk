#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_ATTR extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_C_ACCESS_TOKEN => 2147483666

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_C_FULL_ACCESS_TOKEN => 2147483778

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CERT_TRUST_STATUS => 2147483780

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CREDS => 2147483776

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CREDS_2 => 2147483782

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGOTIATION_PACKAGE => 2147483777

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_PACKAGE_INFO => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SERVER_AUTH_FLAGS => 2147483779

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SIZES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SUBJECT_SECURITY_ATTRIBUTES => 124

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_APP_DATA => 94

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_EAP_PRF_INFO => 101

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_EARLY_START => 105

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_DTLS_MTU => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_KEYING_MATERIAL_INFO => 106

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_ACCESS_TOKEN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_AUTHORITY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CLIENT_SPECIFIED_TARGET => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_CONNECTION_INFO => 90

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_DCE_INFO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_ENDPOINT_BINDINGS => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_EAP_KEY_BLOCK => 91

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_FLAGS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_ISSUER_LIST_EX => 89

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_KEY_INFO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_LAST_CLIENT_TOKEN_STATUS => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_LIFESPAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_LOCAL_CERT_CONTEXT => 84

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_LOCAL_CRED => 82

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NAMES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NATIVE_NAMES => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_NEGOTIATION_INFO => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_PASSWORD_EXPIRY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_REMOTE_CERT_CONTEXT => 83

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_ROOT_STORE => 85

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SESSION_KEY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SESSION_INFO => 93

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_STREAM_SIZES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_SUPPORTED_SIGNATURES => 102

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_TARGET_INFORMATION => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_ATTR_UNIQUE_BINDINGS => 25
}
