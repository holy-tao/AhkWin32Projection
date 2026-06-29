#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the source glyph and location in a monochrome surface to copy glyphs into.
 * @remarks
 * This structure is used in calls to [**ComposeRects**](/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-composerects) to indicate the location glyphs should be copied to and which particular glyph should be copied. A vertex buffer (see [**IDirect3DVertexBuffer9**](/windows/win32/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9)) filled with these structures are created to contain the glyph locations. USHORT members are used to reduce the memory footprint as much as possible.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcomposerectdestination
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DCOMPOSERECTDESTINATION {
    #StructPack 2

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Index particular glyph from vertex buffer containing [**D3DCOMPOSERECTDESC**](d3dcomposerectdesc.md) structures.
     */
    SrcRectIndex : UInt16

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Reserved for alignment purposes.
     */
    Reserved : UInt16

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Left coordinate to begin copy at.
     */
    X : Int16

    /**
     * Type: **[**USHORT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Top coordinate to begin copy at.
     */
    Y : Int16

}
