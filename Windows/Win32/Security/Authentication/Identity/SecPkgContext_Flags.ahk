#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_Flags structure contains information about the flags in the current security context. This structure is returned by QueryContextAttributes (General).
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_flags
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_Flags extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Flag values for the current security context. These values correspond to the flags negotiated by the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> functions.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
