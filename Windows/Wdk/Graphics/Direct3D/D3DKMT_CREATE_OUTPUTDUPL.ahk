#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_CREATE_OUTPUTDUPL extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    KeyedMutexCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RequiredKeyedMutexCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Pointer>}
     */
    KeyedMutexs {
        get {
            if(!this.HasProp("__KeyedMutexsProxyArray"))
                this.__KeyedMutexsProxyArray := Win32FixedArray(this.ptr + 16, 3, Primitive, "ptr")
            return this.__KeyedMutexsProxyArray
        }
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
