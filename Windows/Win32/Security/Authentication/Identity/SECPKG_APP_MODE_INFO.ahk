#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SecBuffer.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_APP_MODE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    UserFunction {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Argument1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Argument2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {SecBuffer}
     */
    UserData{
        get {
            if(!this.HasProp("__UserData"))
                this.__UserData := SecBuffer(this.ptr + 24)
            return this.__UserData
        }
    }

    /**
     * @type {Integer}
     */
    ReturnToLsa {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }
}
