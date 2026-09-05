#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class MSV1_0 extends Win32Enum {

    /**
     * Native name: MSV1_0_PASSTHRU
     * @type {Integer (UInt32)}
     */
    static PASSTHRU => 1

    /**
     * Native name: MSV1_0_GUEST_LOGON
     * @type {Integer (UInt32)}
     */
    static GUEST_LOGON => 2
}
