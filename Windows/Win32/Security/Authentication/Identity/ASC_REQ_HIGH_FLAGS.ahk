#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class ASC_REQ_HIGH_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt64)}
     */
    static ASC_REQ_MESSAGES => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static ASC_REQ_EXPLICIT_SESSION => 68719476736
}
