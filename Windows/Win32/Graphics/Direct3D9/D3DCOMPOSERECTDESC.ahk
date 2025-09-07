#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the rectangle used to enclose glyphs on a monochrome surface.
 * @remarks
 * This structure is used in calls to [**ComposeRects**](/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-composerects) to enclose glyphs on the source surface. A vertex buffer (see [**IDirect3DVertexBuffer9**](/windows/win32/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9)) filled with these structures are created to contain the glyph locations. USHORT members are used to reduce the memory footprint as much as possible.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcomposerectdesc
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCOMPOSERECTDESC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Left coordinate to begin copy at.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Top coordinate to begin copy at.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of texels from left coordinate.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of texels from the top coordinate.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
