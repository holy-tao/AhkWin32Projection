#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_PasswordExpiry structure contains information about the expiration of a password or other credential used for the security context. This structure is returned by QueryContextAttributes (General).
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_passwordexpiry
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_PasswordExpiry extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> variable that indicates when the credentials for the security context expire. For password-based packages, this variable indicates when the password expires. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a>, this variable indicates when the ticket expires.
     * @type {Integer}
     */
    tsPasswordExpires {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
