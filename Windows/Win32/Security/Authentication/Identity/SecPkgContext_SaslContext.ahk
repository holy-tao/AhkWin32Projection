#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgContext_SaslContext extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    SaslContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
