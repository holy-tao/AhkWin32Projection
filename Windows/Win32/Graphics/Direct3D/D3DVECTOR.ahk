#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A 3D vector.
 * @see https://learn.microsoft.com/windows/win32/direct3d10/d3d10-d3dvector
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3DVECTOR {
    #StructPack 4

    /**
     * Type: **float**
     * 
     * 
     * The x component.
     */
    x : Float32

    /**
     * Type: **float**
     * 
     * 
     * The y component.
     */
    y : Float32

    /**
     * Type: **float**
     * 
     * 
     * The z component.
     */
    z : Float32

}
