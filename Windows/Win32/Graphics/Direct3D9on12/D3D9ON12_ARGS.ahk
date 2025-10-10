#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 * @version v4.0.30319
 */
class D3D9ON12_ARGS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Enable9On12 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pD3D12Device {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<IUnknown>}
     */
    ppD3D12Queues{
        get {
            if(!this.HasProp("__ppD3D12QueuesProxyArray"))
                this.__ppD3D12QueuesProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "ptr")
            return this.__ppD3D12QueuesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NumQueues {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
