#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the client and server principal names.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-_secpkgcontext_nativenamesa
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class SecPkgContext_NativeNamesA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The client principal name (CNAME).
     * @type {Pointer<SByte>}
     */
    sClientName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The server principal name (CNAME).
     * @type {Pointer<SByte>}
     */
    sServerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
