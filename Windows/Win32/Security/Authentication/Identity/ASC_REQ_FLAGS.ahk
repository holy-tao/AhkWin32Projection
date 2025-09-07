#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class ASC_REQ_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_DELEGATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_MUTUAL_AUTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_REPLAY_DETECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_SEQUENCE_DETECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_CONFIDENTIALITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_USE_SESSION_KEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_SESSION_TICKET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_ALLOCATE_MEMORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_USE_DCE_STYLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_DATAGRAM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_CONNECTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_CALL_LEVEL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_FRAGMENT_SUPPLIED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_EXTENDED_ERROR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_STREAM => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_INTEGRITY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_LICENSING => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_IDENTIFY => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_ALLOW_NULL_SESSION => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_ALLOW_NON_USER_LOGONS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_ALLOW_CONTEXT_REPLAY => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_FRAGMENT_TO_FIT => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_NO_TOKEN => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_PROXY_BINDINGS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static ASC_REQ_ALLOW_MISSING_BINDINGS => 268435456
}
