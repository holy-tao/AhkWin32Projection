#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains red, green, and blue ramp data.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dgammaramp
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DGAMMARAMP {
    #StructPack 2

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Array of 256 WORD element that describes the red gamma ramp.
     */
    red : UInt16[256]

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Array of 256 WORD element that describes the green gamma ramp.
     */
    green : UInt16[256]

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Array of 256 WORD element that describes the blue gamma ramp.
     */
    blue : UInt16[256]

}
