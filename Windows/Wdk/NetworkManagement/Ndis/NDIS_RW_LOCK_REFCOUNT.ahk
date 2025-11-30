#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_RW_LOCK_REFCOUNT extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    RefCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    cacheLine{
        get {
            if(!this.HasProp("__cacheLineProxyArray"))
                this.__cacheLineProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__cacheLineProxyArray
        }
    }
}
