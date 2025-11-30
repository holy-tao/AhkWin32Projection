#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WORK_ITEM extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<NDIS_PROC>}
     */
    Routine {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    WrapperReserved{
        get {
            if(!this.HasProp("__WrapperReservedProxyArray"))
                this.__WrapperReservedProxyArray := Win32FixedArray(this.ptr + 16, 32, Primitive, "char")
            return this.__WrapperReservedProxyArray
        }
    }
}
