#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SILENT_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_NO_PADDING_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_PAD_OAEP_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_PAD_PKCS1_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_REGISTER_NOTIFY_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_UNREGISTER_NOTIFY_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_MACHINE_KEY_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_UNPROTECT_NO_DECRYPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_OVERWRITE_KEY_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_NO_KEY_VALIDATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_WRITE_KEY_TO_LEGACY_STORE_FLAG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_PAD_PSS_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_PERSIST_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_PERSIST_ONLY_FLAG => 1073741824
}
