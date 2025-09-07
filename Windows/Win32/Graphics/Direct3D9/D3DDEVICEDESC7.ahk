#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DPRIMCAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVICEDESC7 extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwDevCaps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DPRIMCAPS}
     */
    dpcLineCaps{
        get {
            if(!this.HasProp("__dpcLineCaps"))
                this.__dpcLineCaps := D3DPRIMCAPS(this.ptr + 8)
            return this.__dpcLineCaps
        }
    }

    /**
     * @type {D3DPRIMCAPS}
     */
    dpcTriCaps{
        get {
            if(!this.HasProp("__dpcTriCaps"))
                this.__dpcTriCaps := D3DPRIMCAPS(this.ptr + 64)
            return this.__dpcTriCaps
        }
    }

    /**
     * @type {Integer}
     */
    dwDeviceRenderBitDepth {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    dwDeviceZBufferBitDepth {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    dwMinTextureWidth {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    dwMinTextureHeight {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureWidth {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureHeight {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureRepeat {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureAspectRatio {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    dwMaxAnisotropy {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Float}
     */
    dvGuardBandLeft {
        get => NumGet(this, 156, "float")
        set => NumPut("float", value, this, 156)
    }

    /**
     * @type {Float}
     */
    dvGuardBandTop {
        get => NumGet(this, 160, "float")
        set => NumPut("float", value, this, 160)
    }

    /**
     * @type {Float}
     */
    dvGuardBandRight {
        get => NumGet(this, 164, "float")
        set => NumPut("float", value, this, 164)
    }

    /**
     * @type {Float}
     */
    dvGuardBandBottom {
        get => NumGet(this, 168, "float")
        set => NumPut("float", value, this, 168)
    }

    /**
     * @type {Float}
     */
    dvExtentsAdjust {
        get => NumGet(this, 172, "float")
        set => NumPut("float", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    dwStencilCaps {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    dwFVFCaps {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    dwTextureOpCaps {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    wMaxTextureBlendStages {
        get => NumGet(this, 188, "ushort")
        set => NumPut("ushort", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    wMaxSimultaneousTextures {
        get => NumGet(this, 190, "ushort")
        set => NumPut("ushort", value, this, 190)
    }

    /**
     * @type {Integer}
     */
    dwMaxActiveLights {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Float}
     */
    dvMaxVertexW {
        get => NumGet(this, 196, "float")
        set => NumPut("float", value, this, 196)
    }

    /**
     * @type {Pointer<Guid>}
     */
    deviceGUID {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    wMaxUserClipPlanes {
        get => NumGet(this, 208, "ushort")
        set => NumPut("ushort", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    wMaxVertexBlendMatrices {
        get => NumGet(this, 210, "ushort")
        set => NumPut("ushort", value, this, 210)
    }

    /**
     * @type {Integer}
     */
    dwVertexProcessingCaps {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    dwReserved3 {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    dwReserved4 {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }
}
