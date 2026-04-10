#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_FLIPINTERVAL_TYPE.ahk
#Include .\D3DKMT_MULTIPLANE_OVERLAY.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_PRESENT_MULTIPLANE_OVERLAY extends Win32Struct {
    static sizeof => 312

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hDevice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
    BroadcastContextCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Integer>}
     */
    BroadcastContext {
        get {
            if(!this.HasProp("__BroadcastContextProxyArray"))
                this.__BroadcastContextProxyArray := Win32FixedArray(this.ptr + 8, 64, Primitive, "uint")
            return this.__BroadcastContextProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    PresentCount {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {D3DDDI_FLIPINTERVAL_TYPE}
     */
    FlipInterval {
        get => NumGet(this, 272, "int")
        set => NumPut("int", value, this, 272)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    PresentPlaneCount {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Pointer<D3DKMT_MULTIPLANE_OVERLAY>}
     */
    pPresentPlanes {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    Duration {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }
}
