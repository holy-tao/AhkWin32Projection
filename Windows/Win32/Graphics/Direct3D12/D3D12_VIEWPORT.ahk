#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the dimensions of a viewport.
 * @remarks
 * Pass an array of these structures to the <i>pViewports</i> parameter  in a call to  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-rssetviewports">ID3D12GraphicsCommandList::RSSetViewports</a> to set viewports for the display.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_viewport
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_VIEWPORT {
    #StructPack 4

    /**
     * X position of the left hand side of the viewport.
     */
    TopLeftX : Float32

    /**
     * Y position of the top of the viewport.
     */
    TopLeftY : Float32

    /**
     * Width of the viewport.
     */
    Width : Float32

    /**
     * Height of the viewport.
     */
    Height : Float32

    /**
     * Minimum depth of the viewport. Ranges between 0 and 1.
     */
    MinDepth : Float32

    /**
     * Maximum depth of the viewport. Ranges between 0 and 1.
     */
    MaxDepth : Float32

}
