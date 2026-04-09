#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SecPkgInfoW.ahk

/**
 * Holds package information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_packageinfow
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
class SecPkgContext_PackageInfoW extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * The package information.
     * @type {Pointer<SecPkgInfoW>}
     */
    PackageInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
