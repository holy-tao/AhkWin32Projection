#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_FIND_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_FIND_ANY
     * @type {Integer (UInt32)}
     */
    static ANY => 0

    /**
     * Native name: CERT_FIND_CERT_ID
     * @type {Integer (UInt32)}
     */
    static CERT_ID => 1048576

    /**
     * Native name: CERT_FIND_CTL_USAGE
     * @type {Integer (UInt32)}
     */
    static CTL_USAGE => 655360

    /**
     * Native name: CERT_FIND_ENHKEY_USAGE
     * @type {Integer (UInt32)}
     */
    static ENHKEY_USAGE => 655360

    /**
     * Native name: CERT_FIND_EXISTING
     * @type {Integer (UInt32)}
     */
    static EXISTING => 851968

    /**
     * Native name: CERT_FIND_HASH
     * @type {Integer (UInt32)}
     */
    static HASH => 65536

    /**
     * Native name: CERT_FIND_HAS_PRIVATE_KEY
     * @type {Integer (UInt32)}
     */
    static HAS_PRIVATE_KEY => 1376256

    /**
     * Native name: CERT_FIND_ISSUER_ATTR
     * @type {Integer (UInt32)}
     */
    static ISSUER_ATTR => 196612

    /**
     * Native name: CERT_FIND_ISSUER_NAME
     * @type {Integer (UInt32)}
     */
    static ISSUER_NAME => 131076

    /**
     * Native name: CERT_FIND_ISSUER_OF
     * @type {Integer (UInt32)}
     */
    static ISSUER_OF => 786432

    /**
     * Native name: CERT_FIND_ISSUER_STR
     * @type {Integer (UInt32)}
     */
    static ISSUER_STR => 524292

    /**
     * Native name: CERT_FIND_KEY_IDENTIFIER
     * @type {Integer (UInt32)}
     */
    static KEY_IDENTIFIER => 983040

    /**
     * Native name: CERT_FIND_KEY_SPEC
     * @type {Integer (UInt32)}
     */
    static KEY_SPEC => 589824

    /**
     * Native name: CERT_FIND_MD5_HASH
     * @type {Integer (UInt32)}
     */
    static MD5_HASH => 262144

    /**
     * Native name: CERT_FIND_PROPERTY
     * @type {Integer (UInt32)}
     */
    static PROPERTY => 327680

    /**
     * Native name: CERT_FIND_PUBLIC_KEY
     * @type {Integer (UInt32)}
     */
    static PUBLIC_KEY => 393216

    /**
     * Native name: CERT_FIND_SHA1_HASH
     * @type {Integer (UInt32)}
     */
    static SHA1_HASH => 65536

    /**
     * Native name: CERT_FIND_SIGNATURE_HASH
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_HASH => 917504

    /**
     * Native name: CERT_FIND_SUBJECT_ATTR
     * @type {Integer (UInt32)}
     */
    static SUBJECT_ATTR => 196615

    /**
     * Native name: CERT_FIND_SUBJECT_CERT
     * @type {Integer (UInt32)}
     */
    static SUBJECT_CERT => 720896

    /**
     * Native name: CERT_FIND_SUBJECT_NAME
     * @type {Integer (UInt32)}
     */
    static SUBJECT_NAME => 131079

    /**
     * Native name: CERT_FIND_SUBJECT_STR
     * @type {Integer (UInt32)}
     */
    static SUBJECT_STR => 524295

    /**
     * Native name: CERT_FIND_CROSS_CERT_DIST_POINTS
     * @type {Integer (UInt32)}
     */
    static CROSS_CERT_DIST_POINTS => 1114112

    /**
     * Native name: CERT_FIND_PUBKEY_MD5_HASH
     * @type {Integer (UInt32)}
     */
    static PUBKEY_MD5_HASH => 1179648

    /**
     * Native name: CERT_FIND_SHA256_HASH
     * @type {Integer (UInt32)}
     */
    static SHA256_HASH => 1441792

    /**
     * Native name: CERT_FIND_SHA1_SHA256_HASH
     * @type {Integer (UInt32)}
     */
    static SHA1_SHA256_HASH => 1507328

    /**
     * Native name: CERT_FIND_SUBJECT_STR_A
     * @type {Integer (UInt32)}
     */
    static SUBJECT_STR_A => 458759

    /**
     * Native name: CERT_FIND_SUBJECT_STR_W
     * @type {Integer (UInt32)}
     */
    static SUBJECT_STR_W => 524295

    /**
     * Native name: CERT_FIND_ISSUER_STR_A
     * @type {Integer (UInt32)}
     */
    static ISSUER_STR_A => 458756

    /**
     * Native name: CERT_FIND_ISSUER_STR_W
     * @type {Integer (UInt32)}
     */
    static ISSUER_STR_W => 524292

    /**
     * Native name: CERT_FIND_SUBJECT_INFO_ACCESS
     * @type {Integer (UInt32)}
     */
    static SUBJECT_INFO_ACCESS => 1245184

    /**
     * Native name: CERT_FIND_HASH_STR
     * @type {Integer (UInt32)}
     */
    static HASH_STR => 1310720

    /**
     * Native name: CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static OPTIONAL_ENHKEY_USAGE_FLAG => 1

    /**
     * Native name: CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static EXT_ONLY_ENHKEY_USAGE_FLAG => 2

    /**
     * Native name: CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static PROP_ONLY_ENHKEY_USAGE_FLAG => 4

    /**
     * Native name: CERT_FIND_NO_ENHKEY_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static NO_ENHKEY_USAGE_FLAG => 8

    /**
     * Native name: CERT_FIND_OR_ENHKEY_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static OR_ENHKEY_USAGE_FLAG => 16

    /**
     * Native name: CERT_FIND_VALID_ENHKEY_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static VALID_ENHKEY_USAGE_FLAG => 32

    /**
     * Native name: CERT_FIND_OPTIONAL_CTL_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static OPTIONAL_CTL_USAGE_FLAG => 1

    /**
     * Native name: CERT_FIND_EXT_ONLY_CTL_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static EXT_ONLY_CTL_USAGE_FLAG => 2

    /**
     * Native name: CERT_FIND_PROP_ONLY_CTL_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static PROP_ONLY_CTL_USAGE_FLAG => 4

    /**
     * Native name: CERT_FIND_NO_CTL_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static NO_CTL_USAGE_FLAG => 8

    /**
     * Native name: CERT_FIND_OR_CTL_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static OR_CTL_USAGE_FLAG => 16

    /**
     * Native name: CERT_FIND_VALID_CTL_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static VALID_CTL_USAGE_FLAG => 32
}
