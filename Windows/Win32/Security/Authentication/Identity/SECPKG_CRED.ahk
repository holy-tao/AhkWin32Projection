#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SECPKG_CRED extends Win32Enum {

    /**
     * Native name: SECPKG_CRED_INBOUND
     * @type {Integer (UInt32)}
     */
    static INBOUND => 1

    /**
     * Native name: SECPKG_CRED_OUTBOUND
     * @type {Integer (UInt32)}
     */
    static OUTBOUND => 2
}
