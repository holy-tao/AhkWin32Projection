#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class CRED_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRED_FLAGS_PASSWORD_FOR_CERT
     * @type {Integer (UInt32)}
     */
    static PASSWORD_FOR_CERT => 1

    /**
     * Native name: CRED_FLAGS_PROMPT_NOW
     * @type {Integer (UInt32)}
     */
    static PROMPT_NOW => 2

    /**
     * Native name: CRED_FLAGS_USERNAME_TARGET
     * @type {Integer (UInt32)}
     */
    static USERNAME_TARGET => 4

    /**
     * Native name: CRED_FLAGS_OWF_CRED_BLOB
     * @type {Integer (UInt32)}
     */
    static OWF_CRED_BLOB => 8

    /**
     * Native name: CRED_FLAGS_REQUIRE_CONFIRMATION
     * @type {Integer (UInt32)}
     */
    static REQUIRE_CONFIRMATION => 16

    /**
     * Native name: CRED_FLAGS_WILDCARD_MATCH
     * @type {Integer (UInt32)}
     */
    static WILDCARD_MATCH => 32

    /**
     * Native name: CRED_FLAGS_VSM_PROTECTED
     * @type {Integer (UInt32)}
     */
    static VSM_PROTECTED => 64

    /**
     * Native name: CRED_FLAGS_NGC_CERT
     * @type {Integer (UInt32)}
     */
    static NGC_CERT => 128

    /**
     * Native name: CRED_FLAGS_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static VALID_FLAGS => 61695

    /**
     * Native name: CRED_FLAGS_VALID_INPUT_FLAGS
     * @type {Integer (UInt32)}
     */
    static VALID_INPUT_FLAGS => 61599
}
