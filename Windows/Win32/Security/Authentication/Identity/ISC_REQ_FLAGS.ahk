#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class ISC_REQ_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_DELEGATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_MUTUAL_AUTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_REPLAY_DETECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_SEQUENCE_DETECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_CONFIDENTIALITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_USE_SESSION_KEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_PROMPT_FOR_CREDS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_USE_SUPPLIED_CREDS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_ALLOCATE_MEMORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_USE_DCE_STYLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_DATAGRAM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_CONNECTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_CALL_LEVEL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_FRAGMENT_SUPPLIED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_EXTENDED_ERROR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_STREAM => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_INTEGRITY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_IDENTIFY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_NULL_SESSION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_MANUAL_CRED_VALIDATION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_RESERVED1 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_FRAGMENT_TO_FIT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_FORWARD_CREDENTIALS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_NO_INTEGRITY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_USE_HTTP_STYLE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_UNVERIFIED_TARGET_NAME => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_REQ_CONFIDENTIALITY_ONLY => 1073741824
}
