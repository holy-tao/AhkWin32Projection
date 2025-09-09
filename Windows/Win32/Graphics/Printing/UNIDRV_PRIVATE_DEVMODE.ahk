#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class UNIDRV_PRIVATE_DEVMODE extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {Array<UInt16>}
     */
    wReserved{
        get {
            if(!this.HasProp("__wReservedProxyArray"))
                this.__wReservedProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "ushort")
            return this.__wReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    wSize {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
