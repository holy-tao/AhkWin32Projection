#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class ASC_REQ_HIGH_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ASC_REQ_MESSAGES
     * @type {Integer (UInt64)}
     */
    static MESSAGES => 4294967296

    /**
     * Native name: ASC_REQ_EXPLICIT_SESSION
     * @type {Integer (UInt64)}
     */
    static EXPLICIT_SESSION => 68719476736
}
