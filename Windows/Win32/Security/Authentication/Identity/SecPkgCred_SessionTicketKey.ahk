#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgCred_SessionTicketKey extends Win32Struct {
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
     * @type {Array<Integer>}
     */
    KeyId {
        get {
            if(!this.HasProp("__KeyIdProxyArray"))
                this.__KeyIdProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__KeyIdProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    KeyingMaterial {
        get {
            if(!this.HasProp("__KeyingMaterialProxyArray"))
                this.__KeyingMaterialProxyArray := Win32FixedArray(this.ptr + 20, 64, Primitive, "char")
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
