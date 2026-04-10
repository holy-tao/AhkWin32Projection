#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_GAMMARAMP_TYPE.ahk
#Include .\D3DDDI_GAMMA_RAMP_RGB256x3x16.ahk
#Include .\D3DDDI_GAMMA_RAMP_DXGI_1.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_SETGAMMARAMP extends Win32Struct {
    static sizeof => 32

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
    VidPnSourceId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {D3DDDI_GAMMARAMP_TYPE}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<D3DDDI_GAMMA_RAMP_RGB256x3x16>}
     */
    pGammaRampRgb256x3x16 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3DDDI_GAMMA_RAMP_DXGI_1>}
     */
    pGammaRampDXGI1 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
