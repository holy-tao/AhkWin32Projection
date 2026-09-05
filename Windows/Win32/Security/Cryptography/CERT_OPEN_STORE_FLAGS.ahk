#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_OPEN_STORE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_STORE_BACKUP_RESTORE_FLAG
     * @type {Integer (UInt32)}
     */
    static BACKUP_RESTORE_FLAG => 2048

    /**
     * Native name: CERT_STORE_CREATE_NEW_FLAG
     * @type {Integer (UInt32)}
     */
    static CREATE_NEW_FLAG => 8192

    /**
     * Native name: CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG
     * @type {Integer (UInt32)}
     */
    static DEFER_CLOSE_UNTIL_LAST_FREE_FLAG => 4

    /**
     * Native name: CERT_STORE_DELETE_FLAG
     * @type {Integer (UInt32)}
     */
    static DELETE_FLAG => 16

    /**
     * Native name: CERT_STORE_ENUM_ARCHIVED_FLAG
     * @type {Integer (UInt32)}
     */
    static ENUM_ARCHIVED_FLAG => 512

    /**
     * Native name: CERT_STORE_MAXIMUM_ALLOWED_FLAG
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_ALLOWED_FLAG => 4096

    /**
     * Native name: CERT_STORE_NO_CRYPT_RELEASE_FLAG
     * @type {Integer (UInt32)}
     */
    static NO_CRYPT_RELEASE_FLAG => 1

    /**
     * Native name: CERT_STORE_OPEN_EXISTING_FLAG
     * @type {Integer (UInt32)}
     */
    static OPEN_EXISTING_FLAG => 16384

    /**
     * Native name: CERT_STORE_READONLY_FLAG
     * @type {Integer (UInt32)}
     */
    static READONLY_FLAG => 32768

    /**
     * Native name: CERT_STORE_SET_LOCALIZED_NAME_FLAG
     * @type {Integer (UInt32)}
     */
    static SET_LOCALIZED_NAME_FLAG => 2

    /**
     * Native name: CERT_STORE_SHARE_CONTEXT_FLAG
     * @type {Integer (UInt32)}
     */
    static SHARE_CONTEXT_FLAG => 128

    /**
     * Native name: CERT_STORE_UPDATE_KEYID_FLAG
     * @type {Integer (UInt32)}
     */
    static UPDATE_KEYID_FLAG => 1024
}
