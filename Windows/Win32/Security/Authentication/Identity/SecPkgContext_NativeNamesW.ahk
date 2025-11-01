#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_nativenamesw
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset Unicode
 */
class SecPkgContext_NativeNamesW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Integer>}
     */
    sClientName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Integer>}
     */
    sServerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
