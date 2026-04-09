#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DISPLAYMODELIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ModeCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Pointer>}
     */
    pModeList {
        get {
            if(!this.HasProp("__pModeListProxyArray"))
                this.__pModeListProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__pModeListProxyArray
        }
    }
}
