#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SECPKG_SURROGATE_LOGON_ENTRY extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Guid}
     */
    Type {
        get {
            if(!this.HasProp("__Type"))
                this.__Type := Guid(0, this)
            return this.__Type
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Data {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
