#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_DXGI_RGB.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_GAMMA_RAMP_DXGI_1 extends Win32Struct
{
    static sizeof => 8216

    static packingSize => 8

    /**
     * @type {Pointer<D3DDDI_DXGI_RGB>}
     */
    Scale {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<D3DDDI_DXGI_RGB>}
     */
    Offset {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<D3DDDI_DXGI_RGB>}
     */
    GammaCurve{
        get {
            if(!this.HasProp("__GammaCurveProxyArray"))
                this.__GammaCurveProxyArray := Win32FixedArray(this.ptr + 16, 1025, Primitive, "ptr")
            return this.__GammaCurveProxyArray
        }
    }
}
