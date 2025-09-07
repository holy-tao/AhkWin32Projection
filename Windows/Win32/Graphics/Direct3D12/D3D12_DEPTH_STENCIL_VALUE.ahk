#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a depth and stencil value.
 * @remarks
 * This structure is used in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_clear_value">D3D12_CLEAR_VALUE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_value
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEPTH_STENCIL_VALUE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the depth value.
     * @type {Float}
     */
    Depth {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Specifies the stencil value.
     * @type {Integer}
     */
    Stencil {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
