#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DCOLORVALUE.ahk" { D3DCOLORVALUE }

/**
 * Specifies material properties.
 * @remarks
 * To turn off specular highlights, set D3DRS\_SPECULARENABLE to **FALSE**, using [**D3DRENDERSTATETYPE**](./d3drenderstatetype.md). This is the fastest option because no specular highlights will be calculated.
 * 
 * For more information about using the lighting engine to calculate specular lighting, see [Specular Lighting (Direct3D 9)](specular-lighting.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dmaterial9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DMATERIAL9 {
    #StructPack 4

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the diffuse color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     */
    Diffuse : D3DCOLORVALUE

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the ambient color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     */
    Ambient : D3DCOLORVALUE

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the specular color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     */
    Specular : D3DCOLORVALUE

    /**
     * Type: **[**D3DCOLORVALUE**](d3dcolorvalue.md)**
     * 
     * 
     * Value specifying the emissive color of the material. See [**D3DCOLORVALUE**](d3dcolorvalue.md).
     */
    Emissive : D3DCOLORVALUE

    /**
     * Type: **float**
     * 
     * 
     * Floating-point value specifying the sharpness of specular highlights. The higher the value, the sharper the highlight.
     */
    Power : Float32

}
