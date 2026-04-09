#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SecPkgInfoA.ahk

/**
 * Holds application package information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_packageinfoa
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
class SecPkgContext_PackageInfoA extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * The package information.
     * @type {Pointer<SecPkgInfoA>}
     */
    PackageInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
