#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the type of credentials used to create a client context.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_credinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_CredInfo extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ne-sspi-secpkg_cred_class">SECPKG_CRED_CLASS</a> enumeration that indicates the type of credentials.
     * @type {Integer}
     */
    CredClass {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A nonzero value indicates that the application must prompt the user for credentials. All other values indicate that the application does not need to prompt the user.
     * @type {Integer}
     */
    IsPromptingNeeded {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
