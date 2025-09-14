#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_POOLTAG_DESCRIPTION extends Win32Struct
{
    static sizeof => 332

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PoolTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<SByte>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 8, 260, Primitive, "char")
            return this.__DescriptionProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Binary{
        get {
            if(!this.HasProp("__BinaryProxyArray"))
                this.__BinaryProxyArray := Win32FixedArray(this.ptr + 268, 32, Primitive, "char")
            return this.__BinaryProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Owner{
        get {
            if(!this.HasProp("__OwnerProxyArray"))
                this.__OwnerProxyArray := Win32FixedArray(this.ptr + 300, 32, Primitive, "char")
            return this.__OwnerProxyArray
        }
    }
}
