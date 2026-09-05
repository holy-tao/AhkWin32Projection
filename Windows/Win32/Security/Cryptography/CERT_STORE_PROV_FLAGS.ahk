#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_STORE_PROV_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_STORE_PROV_EXTERNAL_FLAG
     * @type {Integer (UInt32)}
     */
    static EXTERNAL_FLAG => 1

    /**
     * Native name: CERT_STORE_PROV_DELETED_FLAG
     * @type {Integer (UInt32)}
     */
    static DELETED_FLAG => 2

    /**
     * Native name: CERT_STORE_PROV_NO_PERSIST_FLAG
     * @type {Integer (UInt32)}
     */
    static NO_PERSIST_FLAG => 4

    /**
     * Native name: CERT_STORE_PROV_SYSTEM_STORE_FLAG
     * @type {Integer (UInt32)}
     */
    static SYSTEM_STORE_FLAG => 8

    /**
     * Native name: CERT_STORE_PROV_LM_SYSTEM_STORE_FLAG
     * @type {Integer (UInt32)}
     */
    static LM_SYSTEM_STORE_FLAG => 16
}
