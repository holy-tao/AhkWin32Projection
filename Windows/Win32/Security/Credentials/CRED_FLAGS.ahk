#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CRED_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_PASSWORD_FOR_CERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_PROMPT_NOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_USERNAME_TARGET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_OWF_CRED_BLOB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_REQUIRE_CONFIRMATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_WILDCARD_MATCH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_VSM_PROTECTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_NGC_CERT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_VALID_FLAGS => 61695

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_FLAGS_VALID_INPUT_FLAGS => 61599
}
