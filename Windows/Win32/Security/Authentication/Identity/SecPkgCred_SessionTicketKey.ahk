#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgCred_SessionTicketKey extends Win32Struct
{
    static sizeof => 88

    static packingSize => 4

    /**
     * @type {Integer}
     */
    TicketInfoVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    KeyId{
        get {
            if(!this.HasProp("__KeyIdProxyArray"))
                this.__KeyIdProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__KeyIdProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    KeyingMaterial{
        get {
            if(!this.HasProp("__KeyingMaterialProxyArray"))
                this.__KeyingMaterialProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__KeyingMaterialProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    KeyingMaterialSize {
        get => NumGet(this, 84, "char")
        set => NumPut("char", value, this, 84)
    }
}
