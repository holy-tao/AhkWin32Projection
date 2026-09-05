#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_ACQUIRE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPT_ACQUIRE_CACHE_FLAG
     * @type {Integer (UInt32)}
     */
    static CACHE_FLAG => 1

    /**
     * Native name: CRYPT_ACQUIRE_USE_PROV_INFO_FLAG
     * @type {Integer (UInt32)}
     */
    static USE_PROV_INFO_FLAG => 2

    /**
     * Native name: CRYPT_ACQUIRE_COMPARE_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static COMPARE_KEY_FLAG => 4

    /**
     * Native name: CRYPT_ACQUIRE_NO_HEALING
     * @type {Integer (UInt32)}
     */
    static NO_HEALING => 8

    /**
     * Native name: CRYPT_ACQUIRE_SILENT_FLAG
     * @type {Integer (UInt32)}
     */
    static SILENT_FLAG => 64

    /**
     * Native name: CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG
     * @type {Integer (UInt32)}
     */
    static WINDOW_HANDLE_FLAG => 128

    /**
     * Native name: CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK
     * @type {Integer (UInt32)}
     */
    static NCRYPT_KEY_FLAGS_MASK => 458752

    /**
     * Native name: CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static ALLOW_NCRYPT_KEY_FLAG => 65536

    /**
     * Native name: CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static PREFER_NCRYPT_KEY_FLAG => 131072

    /**
     * Native name: CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static ONLY_NCRYPT_KEY_FLAG => 262144
}
