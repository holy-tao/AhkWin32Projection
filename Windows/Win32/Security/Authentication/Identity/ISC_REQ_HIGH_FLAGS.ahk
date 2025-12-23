#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class ISC_REQ_HIGH_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_MESSAGES => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_DEFERRED_CRED_VALIDATION => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_NO_POST_HANDSHAKE_AUTH => 17179869184

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_REUSE_SESSION_TICKETS => 34359738368

    /**
     * @type {Integer (UInt64)}
     */
    static ISC_REQ_EXPLICIT_SESSION => 68719476736
}
