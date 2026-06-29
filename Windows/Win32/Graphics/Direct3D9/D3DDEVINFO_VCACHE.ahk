#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Vertex cache optimization hints.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-vcache
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVINFO_VCACHE {
    #StructPack 4

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Bit pattern. Return value must be the FOURCC ('C', 'A', 'C', 'H').
     */
    Pattern : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Optimizations method. Use 0 to get the longest strips. Use 1 to optimize the vertex cache usage.
     */
    OptMethod : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Cache size used as a target for optimization. This is required only if OptMethod is 1.
     */
    CacheSize : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Used by internal optimization methods to determine when to restart strips. This cannot be set or modified by a user. This is required only if OptMethod is 1.
     */
    MagicNumber : UInt32

}
