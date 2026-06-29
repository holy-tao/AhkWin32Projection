#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Describes the subresources involved in resolving at the conclusion of a render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access_resolve_subresource_parameters
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS {
    #StructPack 4

    /**
     * A <b>UINT</b>. The source subresource.
     */
    SrcSubresource : UInt32

    /**
     * A <b>UINT</b>. The destination subresource.
     */
    DstSubresource : UInt32

    /**
     * A <b>UINT</b>. The x coordinate within the destination subresource.
     */
    DstX : UInt32

    /**
     * A <b>UINT</b>. The y coordinate within the destination subresource.
     */
    DstY : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-rect">D3D12_RECT</a>. The rectangle within the source subresource.
     */
    SrcRect : RECT

}
