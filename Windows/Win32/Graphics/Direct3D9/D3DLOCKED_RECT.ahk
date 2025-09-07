#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a locked rectangular region.
 * @remarks
 * The pitch for DXTn formats is different from what was returned in DirectX 7. It now refers to the number of bytes in a row of blocks. For example, if you have a width of 16, then you will have a pitch of 4 blocks (4\*8 for DXT1, 4\*16 for DXT2-5.)
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlocked-rect
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLOCKED_RECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[**INT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of bytes in one row of the surface.
     * @type {Integer}
     */
    Pitch {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **void\***
     * 
     * 
     * Pointer to the locked bits. If a [**RECT**](/windows/win32/api/windef/ns-windef-rect) was provided to the [**LockRect**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3dsurface9-lockrect) call, pBits will be appropriately offset from the start of the surface.
     * @type {Pointer<Void>}
     */
    pBits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
