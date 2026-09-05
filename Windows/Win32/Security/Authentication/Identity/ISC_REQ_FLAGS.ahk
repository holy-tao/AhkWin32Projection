#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class ISC_REQ_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ISC_REQ_DELEGATE
     * @type {Integer (UInt32)}
     */
    static DELEGATE => 1

    /**
     * Native name: ISC_REQ_MUTUAL_AUTH
     * @type {Integer (UInt32)}
     */
    static MUTUAL_AUTH => 2

    /**
     * Native name: ISC_REQ_REPLAY_DETECT
     * @type {Integer (UInt32)}
     */
    static REPLAY_DETECT => 4

    /**
     * Native name: ISC_REQ_SEQUENCE_DETECT
     * @type {Integer (UInt32)}
     */
    static SEQUENCE_DETECT => 8

    /**
     * Native name: ISC_REQ_CONFIDENTIALITY
     * @type {Integer (UInt32)}
     */
    static CONFIDENTIALITY => 16

    /**
     * Native name: ISC_REQ_USE_SESSION_KEY
     * @type {Integer (UInt32)}
     */
    static USE_SESSION_KEY => 32

    /**
     * Native name: ISC_REQ_PROMPT_FOR_CREDS
     * @type {Integer (UInt32)}
     */
    static PROMPT_FOR_CREDS => 64

    /**
     * Native name: ISC_REQ_USE_SUPPLIED_CREDS
     * @type {Integer (UInt32)}
     */
    static USE_SUPPLIED_CREDS => 128

    /**
     * Native name: ISC_REQ_ALLOCATE_MEMORY
     * @type {Integer (UInt32)}
     */
    static ALLOCATE_MEMORY => 256

    /**
     * Native name: ISC_REQ_USE_DCE_STYLE
     * @type {Integer (UInt32)}
     */
    static USE_DCE_STYLE => 512

    /**
     * Native name: ISC_REQ_DATAGRAM
     * @type {Integer (UInt32)}
     */
    static DATAGRAM => 1024

    /**
     * Native name: ISC_REQ_CONNECTION
     * @type {Integer (UInt32)}
     */
    static CONNECTION => 2048

    /**
     * Native name: ISC_REQ_CALL_LEVEL
     * @type {Integer (UInt32)}
     */
    static CALL_LEVEL => 4096

    /**
     * Native name: ISC_REQ_FRAGMENT_SUPPLIED
     * @type {Integer (UInt32)}
     */
    static FRAGMENT_SUPPLIED => 8192

    /**
     * Native name: ISC_REQ_EXTENDED_ERROR
     * @type {Integer (UInt32)}
     */
    static EXTENDED_ERROR => 16384

    /**
     * Native name: ISC_REQ_STREAM
     * @type {Integer (UInt32)}
     */
    static STREAM => 32768

    /**
     * Native name: ISC_REQ_INTEGRITY
     * @type {Integer (UInt32)}
     */
    static INTEGRITY => 65536

    /**
     * Native name: ISC_REQ_IDENTIFY
     * @type {Integer (UInt32)}
     */
    static IDENTIFY => 131072

    /**
     * Native name: ISC_REQ_NULL_SESSION
     * @type {Integer (UInt32)}
     */
    static NULL_SESSION => 262144

    /**
     * Native name: ISC_REQ_MANUAL_CRED_VALIDATION
     * @type {Integer (UInt32)}
     */
    static MANUAL_CRED_VALIDATION => 524288

    /**
     * Native name: ISC_REQ_RESERVED1
     * @type {Integer (UInt32)}
     */
    static RESERVED1 => 1048576

    /**
     * Native name: ISC_REQ_FRAGMENT_TO_FIT
     * @type {Integer (UInt32)}
     */
    static FRAGMENT_TO_FIT => 2097152

    /**
     * Native name: ISC_REQ_FORWARD_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static FORWARD_CREDENTIALS => 4194304

    /**
     * Native name: ISC_REQ_NO_INTEGRITY
     * @type {Integer (UInt32)}
     */
    static NO_INTEGRITY => 8388608

    /**
     * Native name: ISC_REQ_USE_HTTP_STYLE
     * @type {Integer (UInt32)}
     */
    static USE_HTTP_STYLE => 16777216

    /**
     * Native name: ISC_REQ_UNVERIFIED_TARGET_NAME
     * @type {Integer (UInt32)}
     */
    static UNVERIFIED_TARGET_NAME => 536870912

    /**
     * Native name: ISC_REQ_CONFIDENTIALITY_ONLY
     * @type {Integer (UInt32)}
     */
    static CONFIDENTIALITY_ONLY => 1073741824
}
