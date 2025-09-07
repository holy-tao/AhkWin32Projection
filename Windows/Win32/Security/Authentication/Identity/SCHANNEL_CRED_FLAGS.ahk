#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCHANNEL_CRED_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_AUTO_CRED_VALIDATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_CACHE_ONLY_URL_RETRIEVAL_ON_CREATE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_DISABLE_RECONNECTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_IGNORE_NO_REVOCATION_CHECK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_IGNORE_REVOCATION_OFFLINE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_MANUAL_CRED_VALIDATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_NO_DEFAULT_CREDS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_NO_SERVERNAME_CHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_NO_SYSTEM_MAPPER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_REVOCATION_CHECK_CHAIN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_REVOCATION_CHECK_END_CERT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_CRED_USE_DEFAULT_CREDS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_SEND_AUX_RECORD => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_SEND_ROOT_CERT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_USE_STRONG_CRYPTO => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SCH_USE_PRESHAREDKEY_ONLY => 8388608
}
