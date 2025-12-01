#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the credential name and type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-_secpkgcontext_credentialnamea
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class SecPkgContext_CredentialNameA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the type of credential name.
     * @type {Integer}
     */
    CredentialType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the credential name.
     * @type {Pointer<Integer>}
     */
    sCredentialName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
