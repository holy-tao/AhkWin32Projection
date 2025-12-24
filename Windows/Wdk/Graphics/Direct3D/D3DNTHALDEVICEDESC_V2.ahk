#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DTRANSFORMCAPS.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DLIGHTINGCAPS.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DPRIMCAPS.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DNTHALDEVICEDESC_V2 extends Win32Struct
{
    static sizeof => 204

    static packingSize => 4

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
                this.__dtcTransformCaps := D3DTRANSFORMCAPS(16, this)
            return this.__dtcTransformCaps
        }
    }

    /**
     * @type {BOOL}
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
                this.__dlcLightingCaps := D3DLIGHTINGCAPS(28, this)
            return this.__dlcLightingCaps
        }
    }

    /**
     * @type {D3DPRIMCAPS}
     */
    dpcLineCaps{
        get {
            if(!this.HasProp("__dpcLineCaps"))
                this.__dpcLineCaps := D3DPRIMCAPS(44, this)
            return this.__dpcLineCaps
        }
    }

    /**
     * @type {D3DPRIMCAPS}
     */
    dpcTriCaps{
        get {
            if(!this.HasProp("__dpcTriCaps"))
                this.__dpcTriCaps := D3DPRIMCAPS(100, this)
            return this.__dpcTriCaps
        }
    }

    /**
     * @type {Integer}
     */
    dwDeviceRenderBitDepth {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    dwDeviceZBufferBitDepth {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    dwMaxBufferSize {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    dwMaxVertexCount {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    dwMinTextureWidth {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    dwMinTextureHeight {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureWidth {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    dwMaxTextureHeight {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    dwMinStippleWidth {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    dwMaxStippleWidth {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    dwMinStippleHeight {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    dwMaxStippleHeight {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }
}
