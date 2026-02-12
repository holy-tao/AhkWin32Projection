#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of credential used in a client context. The SECPKG_CRED_CLASS enumeration is used in the SecPkgContext_CredInfo structure.
 * @see https://learn.microsoft.com/windows/win32/api//content/sspi/ne-sspi-secpkg_cred_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CRED extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_INBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_OUTBOUND => 2
}
