#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_ACQUIRE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_CACHE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_USE_PROV_INFO_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_COMPARE_KEY_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_NO_HEALING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_SILENT_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG => 262144
}
