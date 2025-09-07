#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the dimensions of a viewport. (D3D10_VIEWPORT)
 * @remarks
 * In all cases, <b>Width</b> and <b>Height</b> must be ≥ 0 and <b>TopLeftX</b> + <b>Width</b> and <b>TopLeftY</b> + <b>Height</b> must be ≤ D3D10_VIEWPORT_BOUNDS_MAX.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_viewport
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_VIEWPORT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * X position of the left hand side of the viewport. Ranges between D3D10_VIEWPORT_BOUNDS_MIN and D3D10_VIEWPORT_BOUNDS_MAX.
     * @type {Integer}
     */
    TopLeftX {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Y position of the top of the viewport. Ranges between D3D10_VIEWPORT_BOUNDS_MIN and D3D10_VIEWPORT_BOUNDS_MAX.
     * @type {Integer}
     */
    TopLeftY {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the viewport.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the viewport.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Minimum depth of the viewport. Ranges between 0 and 1.
     * @type {Float}
     */
    MinDepth {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Maximum depth of the viewport. Ranges between 0 and 1.
     * @type {Float}
     */
    MaxDepth {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
