#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the rectangle used to enclose glyphs on a monochrome surface.
 * @remarks
 * This structure is used in calls to [**ComposeRects**](/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-composerects) to enclose glyphs on the source surface. A vertex buffer (see [**IDirect3DVertexBuffer9**](/windows/win32/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9)) filled with these structures are created to contain the glyph locations. USHORT members are used to reduce the memory footprint as much as possible.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcomposerectdesc
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DCOMPOSERECTDESC {
    #StructPack 2

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Left coordinate to begin copy at.
     */
    X : UInt16

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Top coordinate to begin copy at.
     */
    Y : UInt16

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of texels from left coordinate.
     */
    Width : UInt16

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of texels from the top coordinate.
     */
    Height : UInt16

}
