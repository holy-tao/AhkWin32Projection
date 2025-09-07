#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Vertex cache optimization hints.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-vcache
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_VCACHE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Bit pattern. Return value must be the FOURCC ('C', 'A', 'C', 'H').
     * @type {Integer}
     */
    Pattern {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Optimizations method. Use 0 to get the longest strips. Use 1 to optimize the vertex cache usage.
     * @type {Integer}
     */
    OptMethod {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Cache size used as a target for optimization. This is required only if OptMethod is 1.
     * @type {Integer}
     */
    CacheSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Used by internal optimization methods to determine when to restart strips. This cannot be set or modified by a user. This is required only if OptMethod is 1.
     * @type {Integer}
     */
    MagicNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
