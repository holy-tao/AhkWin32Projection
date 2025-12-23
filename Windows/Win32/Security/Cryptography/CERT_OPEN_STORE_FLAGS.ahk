#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_OPEN_STORE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_BACKUP_RESTORE_FLAG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_CREATE_NEW_FLAG => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_DELETE_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_ENUM_ARCHIVED_FLAG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_MAXIMUM_ALLOWED_FLAG => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_NO_CRYPT_RELEASE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_OPEN_EXISTING_FLAG => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_READONLY_FLAG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SET_LOCALIZED_NAME_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SHARE_CONTEXT_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_UPDATE_KEYID_FLAG => 1024
}
