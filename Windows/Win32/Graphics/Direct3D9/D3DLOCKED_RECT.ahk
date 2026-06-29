#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a locked rectangular region.
 * @remarks
 * The pitch for DXTn formats is different from what was returned in DirectX 7. It now refers to the number of bytes in a row of blocks. For example, if you have a width of 16, then you will have a pitch of 4 blocks (4\*8 for DXT1, 4\*16 for DXT2-5.)
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlocked-rect
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLOCKED_RECT {
    #StructPack 8

    /**
     * Type: **[**INT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of bytes in one row of the surface.
     */
    Pitch : Int32

    /**
     * Type: **void\***
     * 
     * 
     * Pointer to the locked bits. If a [**RECT**](/windows/win32/api/windef/ns-windef-rect) was provided to the [**LockRect**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3dsurface9-lockrect) call, pBits will be appropriately offset from the start of the surface.
     */
    pBits : IntPtr

}
