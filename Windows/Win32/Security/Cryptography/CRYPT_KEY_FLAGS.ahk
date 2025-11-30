#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_KEY_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_EXPORTABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_USER_PROTECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ARCHIVABLE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_CREATE_IV => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_CREATE_SALT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_DATA_KEY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_FORCE_KEY_PROTECTION_HIGH => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_KEK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_INITIATOR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_NO_SALT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ONLINE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_PREGEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_RECIPIENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_SF => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_SGCKEY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_VOLATILE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_MACHINE_KEYSET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_USER_KEYSET => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PKCS12_PREFER_CNG_KSP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PKCS12_ALWAYS_CNG_KSP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PKCS12_ALLOW_OVERWRITE_KEY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PKCS12_NO_PERSIST_KEY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PKCS12_INCLUDE_EXTENDED_PROPERTIES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OAEP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_BLOB_VER3 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_DESTROYKEY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_SSL2_FALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_Y_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_IPSEC_HMAC_KEY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SET_KEY_PROV_HANDLE_PROP_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SET_KEY_CONTEXT_PROP_ID => 1
}
