#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class NCRYPT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: NCRYPT_SILENT_FLAG
     * @type {Integer (UInt32)}
     */
    static SILENT_FLAG => 64

    /**
     * Native name: NCRYPT_NO_PADDING_FLAG
     * @type {Integer (UInt32)}
     */
    static NO_PADDING_FLAG => 1

    /**
     * Native name: NCRYPT_PAD_OAEP_FLAG
     * @type {Integer (UInt32)}
     */
    static PAD_OAEP_FLAG => 4

    /**
     * Native name: NCRYPT_PAD_PKCS1_FLAG
     * @type {Integer (UInt32)}
     */
    static PAD_PKCS1_FLAG => 2

    /**
     * Native name: NCRYPT_REGISTER_NOTIFY_FLAG
     * @type {Integer (UInt32)}
     */
    static REGISTER_NOTIFY_FLAG => 1

    /**
     * Native name: NCRYPT_UNREGISTER_NOTIFY_FLAG
     * @type {Integer (UInt32)}
     */
    static UNREGISTER_NOTIFY_FLAG => 2

    /**
     * Native name: NCRYPT_MACHINE_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static MACHINE_KEY_FLAG => 32

    /**
     * Native name: NCRYPT_UNPROTECT_NO_DECRYPT
     * @type {Integer (UInt32)}
     */
    static UNPROTECT_NO_DECRYPT => 1

    /**
     * Native name: NCRYPT_OVERWRITE_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static OVERWRITE_KEY_FLAG => 128

    /**
     * Native name: NCRYPT_NO_KEY_VALIDATION
     * @type {Integer (UInt32)}
     */
    static NO_KEY_VALIDATION => 8

    /**
     * Native name: NCRYPT_WRITE_KEY_TO_LEGACY_STORE_FLAG
     * @type {Integer (UInt32)}
     */
    static WRITE_KEY_TO_LEGACY_STORE_FLAG => 512

    /**
     * Native name: NCRYPT_PAD_PSS_FLAG
     * @type {Integer (UInt32)}
     */
    static PAD_PSS_FLAG => 8

    /**
     * Native name: NCRYPT_PERSIST_FLAG
     * @type {Integer (UInt32)}
     */
    static PERSIST_FLAG => 2147483648

    /**
     * Native name: NCRYPT_PERSIST_ONLY_FLAG
     * @type {Integer (UInt32)}
     */
    static PERSIST_ONLY_FLAG => 1073741824
}
