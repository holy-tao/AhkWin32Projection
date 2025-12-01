#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the AuthzID of the security context.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_authzid
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_AuthzID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length of **AuthzID**, in bytes.
     * @type {Integer}
     */
    AuthzIDLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The AuthzID.
     * @type {PSTR}
     */
    AuthzID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
