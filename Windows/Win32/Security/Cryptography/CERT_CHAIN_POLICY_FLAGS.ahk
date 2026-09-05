#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_CHAIN_POLICY_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_NOT_TIME_VALID_FLAG => 1

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_CTL_NOT_TIME_VALID_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_CTL_NOT_TIME_VALID_FLAG => 2

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_NOT_TIME_NESTED_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_NOT_TIME_NESTED_FLAG => 4

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_INVALID_BASIC_CONSTRAINTS_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_INVALID_BASIC_CONSTRAINTS_FLAG => 8

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_ALL_NOT_TIME_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static IGNORE_ALL_NOT_TIME_VALID_FLAGS => 7

    /**
     * Native name: CERT_CHAIN_POLICY_ALLOW_UNKNOWN_CA_FLAG
     * @type {Integer (UInt32)}
     */
    static ALLOW_UNKNOWN_CA_FLAG => 16

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_WRONG_USAGE_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_WRONG_USAGE_FLAG => 32

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_INVALID_NAME_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_INVALID_NAME_FLAG => 64

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_INVALID_POLICY_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_INVALID_POLICY_FLAG => 128

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_END_REV_UNKNOWN_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_END_REV_UNKNOWN_FLAG => 256

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG => 512

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_CA_REV_UNKNOWN_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_CA_REV_UNKNOWN_FLAG => 1024

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_ROOT_REV_UNKNOWN_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_ROOT_REV_UNKNOWN_FLAG => 2048

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_ALL_REV_UNKNOWN_FLAGS
     * @type {Integer (UInt32)}
     */
    static IGNORE_ALL_REV_UNKNOWN_FLAGS => 3840

    /**
     * Native name: CERT_CHAIN_POLICY_ALLOW_TESTROOT_FLAG
     * @type {Integer (UInt32)}
     */
    static ALLOW_TESTROOT_FLAG => 32768

    /**
     * Native name: CERT_CHAIN_POLICY_TRUST_TESTROOT_FLAG
     * @type {Integer (UInt32)}
     */
    static TRUST_TESTROOT_FLAG => 16384

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_NOT_SUPPORTED_CRITICAL_EXT_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_NOT_SUPPORTED_CRITICAL_EXT_FLAG => 8192

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_PEER_TRUST_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_PEER_TRUST_FLAG => 4096

    /**
     * Native name: CERT_CHAIN_POLICY_IGNORE_WEAK_SIGNATURE_FLAG
     * @type {Integer (UInt32)}
     */
    static IGNORE_WEAK_SIGNATURE_FLAG => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_CA_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_END_ENTITY_FLAG => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_ROOT_CERT_CHAIN_POLICY_ENABLE_TEST_ROOT_FLAG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_ROOT_CERT_CHAIN_POLICY_CHECK_APPLICATION_ROOT_FLAG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_ROOT_CERT_CHAIN_POLICY_DISABLE_FLIGHT_ROOT_FLAG => 262144
}
