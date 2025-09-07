#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STORE_PROV_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_EXTERNAL_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_DELETED_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_NO_PERSIST_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_SYSTEM_STORE_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_LM_SYSTEM_STORE_FLAG => 16
}
