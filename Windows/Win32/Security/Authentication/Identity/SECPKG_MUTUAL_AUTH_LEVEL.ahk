#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SECPKG_MUTUAL_AUTH_LEVEL structure contains the authentication level used by a security package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_mutual_auth_level
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_MUTUAL_AUTH_LEVEL extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The mutual authentication level.
     * @type {Integer}
     */
    MutualAuthLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
