#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk

/**
 * Specifies material properties.
 * @remarks
 * To turn off specular highlights, set D3DRS\_SPECULARENABLE to **FALSE**, using [**D3DRENDERSTATETYPE**](./d3drenderstatetype.md). This is the fastest option because no specular highlights will be calculated.
  * 
  * For more information about using the lighting engine to calculate specular lighting, see [Specular Lighting (Direct3D 9)](specular-lighting.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dmaterial9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DMATERIAL9 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the diffuse color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     * @type {D3DCOLORVALUE}
     */
    Diffuse{
        get {
            if(!this.HasProp("__Diffuse"))
                this.__Diffuse := D3DCOLORVALUE(this.ptr + 0)
            return this.__Diffuse
        }
    }

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the ambient color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     * @type {D3DCOLORVALUE}
     */
    Ambient{
        get {
            if(!this.HasProp("__Ambient"))
                this.__Ambient := D3DCOLORVALUE(this.ptr + 16)
            return this.__Ambient
        }
    }

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the specular color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     * @type {D3DCOLORVALUE}
     */
    Specular{
        get {
            if(!this.HasProp("__Specular"))
                this.__Specular := D3DCOLORVALUE(this.ptr + 32)
            return this.__Specular
        }
    }

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the emissive color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     * @type {D3DCOLORVALUE}
     */
    Emissive{
        get {
            if(!this.HasProp("__Emissive"))
                this.__Emissive := D3DCOLORVALUE(this.ptr + 48)
            return this.__Emissive
        }
    }

    /**
     * Type: **float**
     * 
     * 
     * Floating-point value specifying the sharpness of specular highlights. The higher the value, the sharper the highlight.
     * @type {Float}
     */
    Power {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }
}
