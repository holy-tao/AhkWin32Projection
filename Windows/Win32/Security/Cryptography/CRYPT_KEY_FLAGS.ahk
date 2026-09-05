#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_KEY_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPT_EXPORTABLE
     * @type {Integer (UInt32)}
     */
    static EXPORTABLE => 1

    /**
     * Native name: CRYPT_USER_PROTECTED
     * @type {Integer (UInt32)}
     */
    static USER_PROTECTED => 2

    /**
     * Native name: CRYPT_ARCHIVABLE
     * @type {Integer (UInt32)}
     */
    static ARCHIVABLE => 16384

    /**
     * Native name: CRYPT_CREATE_IV
     * @type {Integer (UInt32)}
     */
    static CREATE_IV => 512

    /**
     * Native name: CRYPT_CREATE_SALT
     * @type {Integer (UInt32)}
     */
    static CREATE_SALT => 4

    /**
     * Native name: CRYPT_DATA_KEY
     * @type {Integer (UInt32)}
     */
    static DATA_KEY => 2048

    /**
     * Native name: CRYPT_FORCE_KEY_PROTECTION_HIGH
     * @type {Integer (UInt32)}
     */
    static FORCE_KEY_PROTECTION_HIGH => 32768

    /**
     * Native name: CRYPT_KEK
     * @type {Integer (UInt32)}
     */
    static KEK => 1024

    /**
     * Native name: CRYPT_INITIATOR
     * @type {Integer (UInt32)}
     */
    static INITIATOR => 64

    /**
     * Native name: CRYPT_NO_SALT
     * @type {Integer (UInt32)}
     */
    static NO_SALT => 16

    /**
     * Native name: CRYPT_ONLINE
     * @type {Integer (UInt32)}
     */
    static ONLINE => 128

    /**
     * Native name: CRYPT_PREGEN
     * @type {Integer (UInt32)}
     */
    static PREGEN => 64

    /**
     * Native name: CRYPT_RECIPIENT
     * @type {Integer (UInt32)}
     */
    static RECIPIENT => 16

    /**
     * Native name: CRYPT_SF
     * @type {Integer (UInt32)}
     */
    static SF => 256

    /**
     * Native name: CRYPT_SGCKEY
     * @type {Integer (UInt32)}
     */
    static SGCKEY => 8192

    /**
     * Native name: CRYPT_VOLATILE
     * @type {Integer (UInt32)}
     */
    static VOLATILE => 4096

    /**
     * Native name: CRYPT_MACHINE_KEYSET
     * @type {Integer (UInt32)}
     */
    static MACHINE_KEYSET => 32

    /**
     * Native name: CRYPT_USER_KEYSET
     * @type {Integer (UInt32)}
     */
    static USER_KEYSET => 4096

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
     * Native name: CRYPT_OAEP
     * @type {Integer (UInt32)}
     */
    static OAEP => 64

    /**
     * Native name: CRYPT_BLOB_VER3
     * @type {Integer (UInt32)}
     */
    static BLOB_VER3 => 128

    /**
     * Native name: CRYPT_DESTROYKEY
     * @type {Integer (UInt32)}
     */
    static DESTROYKEY => 4

    /**
     * Native name: CRYPT_SSL2_FALLBACK
     * @type {Integer (UInt32)}
     */
    static SSL2_FALLBACK => 2

    /**
     * Native name: CRYPT_Y_ONLY
     * @type {Integer (UInt32)}
     */
    static Y_ONLY => 1

    /**
     * Native name: CRYPT_IPSEC_HMAC_KEY
     * @type {Integer (UInt32)}
     */
    static IPSEC_HMAC_KEY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SET_KEY_PROV_HANDLE_PROP_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SET_KEY_CONTEXT_PROP_ID => 1
}
