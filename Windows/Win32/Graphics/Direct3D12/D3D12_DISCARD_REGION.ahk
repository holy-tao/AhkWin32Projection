#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes details for the discard-resource operation.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-discardresource">ID3D12GraphicsCommandList::DiscardResource</a> method.
 *       
 * 
 * If rectangles are supplied in this structure, the resource must have 2D subresources with all specified subresources the same dimension.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_discard_region
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DISCARD_REGION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of rectangles in the array that the <b>pRects</b> member specifies.
     * @type {Integer}
     */
    NumRects {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <b>D3D12_RECT</b> structures for the rectangles in the resource to discard.
     *             If <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-discardresource">DiscardResource</a> discards the entire resource.
     * @type {Pointer<RECT>}
     */
    pRects {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Index of the first subresource in the resource to discard.
     * @type {Integer}
     */
    FirstSubresource {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of subresources in the resource to discard.
     * @type {Integer}
     */
    NumSubresources {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
