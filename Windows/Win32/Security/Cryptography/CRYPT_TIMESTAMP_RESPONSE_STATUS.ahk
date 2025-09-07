#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_TIMESTAMP_RESPONSE_STATUS{

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_GRANTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_GRANTED_WITH_MODS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_REJECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_WAITING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_REVOCATION_WARNING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP_STATUS_REVOKED => 5
}
