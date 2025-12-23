#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_FIND_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_CERT_ID => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_CTL_USAGE => 655360

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ENHKEY_USAGE => 655360

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_EXISTING => 851968

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_HASH => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_HAS_PRIVATE_KEY => 1376256

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ISSUER_ATTR => 196612

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ISSUER_NAME => 131076

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ISSUER_OF => 786432

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ISSUER_STR => 524292

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_KEY_IDENTIFIER => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_KEY_SPEC => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_MD5_HASH => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_PROPERTY => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_PUBLIC_KEY => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SHA1_HASH => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SIGNATURE_HASH => 917504

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SUBJECT_ATTR => 196615

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SUBJECT_CERT => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SUBJECT_NAME => 131079

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SUBJECT_STR => 524295

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_CROSS_CERT_DIST_POINTS => 1114112

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_PUBKEY_MD5_HASH => 1179648

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SHA256_HASH => 1441792

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SHA1_SHA256_HASH => 1507328

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SUBJECT_STR_A => 458759

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SUBJECT_STR_W => 524295

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ISSUER_STR_A => 458756

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_ISSUER_STR_W => 524292

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_SUBJECT_INFO_ACCESS => 1245184

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_HASH_STR => 1310720

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_NO_ENHKEY_USAGE_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_OR_ENHKEY_USAGE_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_VALID_ENHKEY_USAGE_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_OPTIONAL_CTL_USAGE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_EXT_ONLY_CTL_USAGE_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_PROP_ONLY_CTL_USAGE_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_NO_CTL_USAGE_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_OR_CTL_USAGE_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_FIND_VALID_CTL_USAGE_FLAG => 32
}
