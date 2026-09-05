#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_TIMESTAMP_RESPONSE_STATUS extends Win32Enum {

    /**
     * Native name: TIMESTAMP_STATUS_GRANTED
     * @type {Integer (UInt32)}
     */
    static GRANTED => 0

    /**
     * Native name: TIMESTAMP_STATUS_GRANTED_WITH_MODS
     * @type {Integer (UInt32)}
     */
    static GRANTED_WITH_MODS => 1

    /**
     * Native name: TIMESTAMP_STATUS_REJECTED
     * @type {Integer (UInt32)}
     */
    static REJECTED => 2

    /**
     * Native name: TIMESTAMP_STATUS_WAITING
     * @type {Integer (UInt32)}
     */
    static WAITING => 3

    /**
     * Native name: TIMESTAMP_STATUS_REVOCATION_WARNING
     * @type {Integer (UInt32)}
     */
    static REVOCATION_WARNING => 4

    /**
     * Native name: TIMESTAMP_STATUS_REVOKED
     * @type {Integer (UInt32)}
     */
    static REVOKED => 5
}
