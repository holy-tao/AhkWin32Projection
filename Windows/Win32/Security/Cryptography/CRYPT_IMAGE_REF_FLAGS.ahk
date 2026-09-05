#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_IMAGE_REF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPT_MIN_DEPENDENCIES
     * @type {Integer (UInt32)}
     */
    static MIN_DEPENDENCIES => 1

    /**
     * Native name: CRYPT_PROCESS_ISOLATE
     * @type {Integer (UInt32)}
     */
    static PROCESS_ISOLATE => 65536
}
