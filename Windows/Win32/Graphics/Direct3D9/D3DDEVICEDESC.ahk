#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DTRANSFORMCAPS.ahk
#Include .\D3DLIGHTINGCAPS.ahk
#Include .\D3DPRIMCAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVICEDESC extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dcmColorModel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwDevCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {D3DTRANSFORMCAPS}
     */
    dtcTransformCaps{
        get {
            if(!this.HasProp("__dtcTransformCaps"))
                this.__dtcTransformCaps := D3DTRANSFORMCAPS(this.ptr + 16)
            return this.__dtcTransformCaps
        }
    }

    /**
     * @type {Integer}
     */
    bClipping {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {D3DLIGHTINGCAPS}
     */
    dlcLightingCaps{
        get {
            if(!this.HasProp("__dlcLightingCaps"))
                this.__dlcLightingCaps := D3DLIGHTINGCAPS(this.ptr + 32)
            return this.__dlcLightingCaps
        }
    }

    /**
     * @type {D3DPRIMCAPS}
     */
    dpcLineCaps{
        get {
            if(!this.HasProp("__dpcLineCaps"))
                this.__dpcLineCaps := D3DPRIMCAPS(this.ptr + 48)
            return this.__dpcLineCaps
        }
    }

    /**
     * @type {D3DPRIMCAPS}
     */
    dpcTriCaps{
        get {
            if(!this.HasProp("__dpcTriCaps"))
                this.__dpcTriCaps := D3DPRIMCAPS(this.ptr + 104)
            return this.__dpcTriCaps
        }
    }

    /**
     * @type {Integer}
     */
    dwDeviceRenderBitDepth {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    dwDeviceZBufferBitDepth {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    dwMaxBufferSize {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    dwMaxVertexCount {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    dwMinTextureWidth {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    dwMinTextureHeight {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureWidth {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureHeight {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    dwMinStippleWidth {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    dwMaxStippleWidth {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    dwMinStippleHeight {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    dwMaxStippleHeight {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureRepeat {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureAspectRatio {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    dwMaxAnisotropy {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Float}
     */
    dvGuardBandLeft {
        get => NumGet(this, 220, "float")
        set => NumPut("float", value, this, 220)
    }

    /**
     * @type {Float}
     */
    dvGuardBandTop {
        get => NumGet(this, 224, "float")
        set => NumPut("float", value, this, 224)
    }

    /**
     * @type {Float}
     */
    dvGuardBandRight {
        get => NumGet(this, 228, "float")
        set => NumPut("float", value, this, 228)
    }

    /**
     * @type {Float}
     */
    dvGuardBandBottom {
        get => NumGet(this, 232, "float")
        set => NumPut("float", value, this, 232)
    }

    /**
     * @type {Float}
     */
    dvExtentsAdjust {
        get => NumGet(this, 236, "float")
        set => NumPut("float", value, this, 236)
    }

    /**
     * @type {Integer}
     */
    dwStencilCaps {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    dwFVFCaps {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * @type {Integer}
     */
    dwTextureOpCaps {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    wMaxTextureBlendStages {
        get => NumGet(this, 252, "ushort")
        set => NumPut("ushort", value, this, 252)
    }

    /**
     * @type {Integer}
     */
    wMaxSimultaneousTextures {
        get => NumGet(this, 254, "ushort")
        set => NumPut("ushort", value, this, 254)
    }
}
