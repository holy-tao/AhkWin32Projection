#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_SIGNALSYNCHRONIZATIONOBJECT extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hContext {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ObjectCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    ObjectHandleArray{
        get {
            if(!this.HasProp("__ObjectHandleArrayProxyArray"))
                this.__ObjectHandleArrayProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "uint")
            return this.__ObjectHandleArrayProxyArray
        }
    }

    /**
     * @type {Pointer<D3DDDICB_SIGNALFLAGS>}
     */
    Flags {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }
}
