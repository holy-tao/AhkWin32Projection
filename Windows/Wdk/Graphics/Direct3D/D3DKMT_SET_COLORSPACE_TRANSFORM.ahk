#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_GAMMARAMP_TYPE.ahk
#Include .\D3DKMDT_3x4_COLORSPACE_TRANSFORM.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_SET_COLORSPACE_TRANSFORM extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    AdapterLuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VidPnTargetId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3DDDI_GAMMARAMP_TYPE}
     */
    Type {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<D3DKMDT_3x4_COLORSPACE_TRANSFORM>}
     */
    pColorSpaceTransform {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
