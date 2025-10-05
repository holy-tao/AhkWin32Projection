#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Holds information about the negotiated application package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_negopackageinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_NegoPackageInfo extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The mask information for the package.
     * @type {Integer}
     */
    PackageMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
