#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BCRYPT_INTERFACE_VERSION.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_RNG_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {BCRYPT_INTERFACE_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := BCRYPT_INTERFACE_VERSION(this.ptr + 0)
            return this.__Version
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    OpenAlgorithmProvider {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GetProperty {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SetProperty {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    CloseAlgorithmProvider {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GenRandom {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
