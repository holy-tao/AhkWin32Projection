#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SE_ADT_ACCESS_REASON extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AccessMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    AccessReasons{
        get {
            if(!this.HasProp("__AccessReasonsProxyArray"))
                this.__AccessReasonsProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "uint")
            return this.__AccessReasonsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ObjectTypeIndex {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    AccessGranted {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SecurityDescriptor {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
