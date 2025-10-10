#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_DceInfo structure contains authorization data used by DCE services. The QueryContextAttributes (General) function uses this structure.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_dceinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_DceInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the authorization service used. For DCE use only.
     * @type {Integer}
     */
    AuthzSvc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to package-specific authorization data.
     * @type {Pointer<Void>}
     */
    pPac {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
