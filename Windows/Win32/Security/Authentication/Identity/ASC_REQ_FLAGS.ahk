#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class ASC_REQ_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ASC_REQ_DELEGATE
     * @type {Integer (UInt32)}
     */
    static DELEGATE => 1

    /**
     * Native name: ASC_REQ_MUTUAL_AUTH
     * @type {Integer (UInt32)}
     */
    static MUTUAL_AUTH => 2

    /**
     * Native name: ASC_REQ_REPLAY_DETECT
     * @type {Integer (UInt32)}
     */
    static REPLAY_DETECT => 4

    /**
     * Native name: ASC_REQ_SEQUENCE_DETECT
     * @type {Integer (UInt32)}
     */
    static SEQUENCE_DETECT => 8

    /**
     * Native name: ASC_REQ_CONFIDENTIALITY
     * @type {Integer (UInt32)}
     */
    static CONFIDENTIALITY => 16

    /**
     * Native name: ASC_REQ_USE_SESSION_KEY
     * @type {Integer (UInt32)}
     */
    static USE_SESSION_KEY => 32

    /**
     * Native name: ASC_REQ_SESSION_TICKET
     * @type {Integer (UInt32)}
     */
    static SESSION_TICKET => 64

    /**
     * Native name: ASC_REQ_ALLOCATE_MEMORY
     * @type {Integer (UInt32)}
     */
    static ALLOCATE_MEMORY => 256

    /**
     * Native name: ASC_REQ_USE_DCE_STYLE
     * @type {Integer (UInt32)}
     */
    static USE_DCE_STYLE => 512

    /**
     * Native name: ASC_REQ_DATAGRAM
     * @type {Integer (UInt32)}
     */
    static DATAGRAM => 1024

    /**
     * Native name: ASC_REQ_CONNECTION
     * @type {Integer (UInt32)}
     */
    static CONNECTION => 2048

    /**
     * Native name: ASC_REQ_CALL_LEVEL
     * @type {Integer (UInt32)}
     */
    static CALL_LEVEL => 4096

    /**
     * Native name: ASC_REQ_FRAGMENT_SUPPLIED
     * @type {Integer (UInt32)}
     */
    static FRAGMENT_SUPPLIED => 8192

    /**
     * Native name: ASC_REQ_EXTENDED_ERROR
     * @type {Integer (UInt32)}
     */
    static EXTENDED_ERROR => 32768

    /**
     * Native name: ASC_REQ_STREAM
     * @type {Integer (UInt32)}
     */
    static STREAM => 65536

    /**
     * Native name: ASC_REQ_INTEGRITY
     * @type {Integer (UInt32)}
     */
    static INTEGRITY => 131072

    /**
     * Native name: ASC_REQ_LICENSING
     * @type {Integer (UInt32)}
     */
    static LICENSING => 262144

    /**
     * Native name: ASC_REQ_IDENTIFY
     * @type {Integer (UInt32)}
     */
    static IDENTIFY => 524288

    /**
     * Native name: ASC_REQ_ALLOW_NULL_SESSION
     * @type {Integer (UInt32)}
     */
    static ALLOW_NULL_SESSION => 1048576

    /**
     * Native name: ASC_REQ_ALLOW_NON_USER_LOGONS
     * @type {Integer (UInt32)}
     */
    static ALLOW_NON_USER_LOGONS => 2097152

    /**
     * Native name: ASC_REQ_ALLOW_CONTEXT_REPLAY
     * @type {Integer (UInt32)}
     */
    static ALLOW_CONTEXT_REPLAY => 4194304

    /**
     * Native name: ASC_REQ_FRAGMENT_TO_FIT
     * @type {Integer (UInt32)}
     */
    static FRAGMENT_TO_FIT => 8388608

    /**
     * Native name: ASC_REQ_NO_TOKEN
     * @type {Integer (UInt32)}
     */
    static NO_TOKEN => 16777216

    /**
     * Native name: ASC_REQ_PROXY_BINDINGS
     * @type {Integer (UInt32)}
     */
    static PROXY_BINDINGS => 67108864

    /**
     * Native name: ASC_REQ_ALLOW_MISSING_BINDINGS
     * @type {Integer (UInt32)}
     */
    static ALLOW_MISSING_BINDINGS => 268435456
}
