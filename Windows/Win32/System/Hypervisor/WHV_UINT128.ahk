#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_UINT128 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Low64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    High64 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt32>}
     */
    Dword{
        get {
            if(!this.HasProp("__DwordProxyArray"))
                this.__DwordProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__DwordProxyArray
        }
    }
}
