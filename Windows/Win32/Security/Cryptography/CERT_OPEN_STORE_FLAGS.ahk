#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_OPEN_STORE_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
