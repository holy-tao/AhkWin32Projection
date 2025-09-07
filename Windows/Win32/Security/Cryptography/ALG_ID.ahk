#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies an algorithm identifier.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/alg-id
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ALG_ID{

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_MD2 => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_MD4 => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_MD5 => 32771

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SHA => 32772

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SHA1 => 32772

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_MAC => 32773

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_RSA_SIGN => 9216

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_DSS_SIGN => 8704

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_NO_SIGN => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_RSA_KEYX => 41984

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_DES => 26113

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_3DES_112 => 26121

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_3DES => 26115

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_DESX => 26116

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_RC2 => 26114

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_RC4 => 26625

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SEAL => 26626

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_DH_SF => 43521

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_DH_EPHEM => 43522

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_AGREEDKEY_ANY => 43523

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_KEA_KEYX => 43524

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_HUGHES_MD5 => 40963

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SKIPJACK => 26122

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_TEK => 26123

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_CYLINK_MEK => 26124

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SSL3_SHAMD5 => 32776

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SSL3_MASTER => 19457

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SCHANNEL_MASTER_HASH => 19458

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SCHANNEL_MAC_KEY => 19459

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SCHANNEL_ENC_KEY => 19463

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_PCT1_MASTER => 19460

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SSL2_MASTER => 19461

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_TLS1_MASTER => 19462

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_RC5 => 26125

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_HMAC => 32777

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_TLS1PRF => 32778

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_HASH_REPLACE_OWF => 32779

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_AES_128 => 26126

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_AES_192 => 26127

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_AES_256 => 26128

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_AES => 26129

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SHA_256 => 32780

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SHA_384 => 32781

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_SHA_512 => 32782

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_ECDH => 43525

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_ECDH_EPHEM => 44550

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_ECMQV => 40961

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_ECDSA => 8707

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_NULLCIPHER => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_THIRDPARTY_KEY_EXCHANGE => 45056

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_THIRDPARTY_SIGNATURE => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_THIRDPARTY_CIPHER => 28672

    /**
     * @type {Integer (UInt32)}
     */
    static CALG_THIRDPARTY_HASH => 36864
}
