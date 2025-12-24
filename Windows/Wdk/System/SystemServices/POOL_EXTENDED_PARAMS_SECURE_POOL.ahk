#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class POOL_EXTENDED_PARAMS_SECURE_POOL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    SecurePoolHandle{
        get {
            if(!this.HasProp("__SecurePoolHandle"))
                this.__SecurePoolHandle := HANDLE(0, this)
            return this.__SecurePoolHandle
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Cookie {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SecurePoolFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
