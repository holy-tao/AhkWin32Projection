#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Describes details for the discard-resource operation.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-discardresource">ID3D12GraphicsCommandList::DiscardResource</a> method.
 *       
 * 
 * If rectangles are supplied in this structure, the resource must have 2D subresources with all specified subresources the same dimension.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_discard_region
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DISCARD_REGION {
    #StructPack 8

    /**
     * The number of rectangles in the array that the <b>pRects</b> member specifies.
     */
    NumRects : UInt32

    /**
     * An array of <b>D3D12_RECT</b> structures for the rectangles in the resource to discard.
     *             If <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-discardresource">DiscardResource</a> discards the entire resource.
     */
    pRects : RECT.Ptr

    /**
     * Index of the first subresource in the resource to discard.
     */
    FirstSubresource : UInt32

    /**
     * The number of subresources in the resource to discard.
     */
    NumSubresources : UInt32

}
