#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class ISC_REQ_HIGH_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ISC_REQ_MESSAGES
     * @type {Integer (UInt64)}
     */
    static MESSAGES => 4294967296

    /**
     * Native name: ISC_REQ_DEFERRED_CRED_VALIDATION
     * @type {Integer (UInt64)}
     */
    static DEFERRED_CRED_VALIDATION => 8589934592

    /**
     * Native name: ISC_REQ_NO_POST_HANDSHAKE_AUTH
     * @type {Integer (UInt64)}
     */
    static NO_POST_HANDSHAKE_AUTH => 17179869184

    /**
     * Native name: ISC_REQ_REUSE_SESSION_TICKETS
     * @type {Integer (UInt64)}
     */
    static REUSE_SESSION_TICKETS => 34359738368

    /**
     * Native name: ISC_REQ_EXPLICIT_SESSION
     * @type {Integer (UInt64)}
     */
    static EXPLICIT_SESSION => 68719476736
}
