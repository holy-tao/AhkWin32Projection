#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes the format, width, height, depth, and row-pitch of the subresource into the parent resource.
 * @remarks
 * Use this structure in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a> structure.
 *       
 * 
 * The helper structure is <a href="https://docs.microsoft.com/windows/desktop/direct3d12/cd3dx12-subresource-footprint">CD3DX12_SUBRESOURCE_FOOTPRINT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_footprint
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SUBRESOURCE_FOOTPRINT {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that  specifies the viewing format.
     */
    Format : DXGI_FORMAT

    /**
     * The width of the subresource.
     */
    Width : UInt32

    /**
     * The height of the subresource.
     */
    Height : UInt32

    /**
     * The depth of the subresource.
     */
    Depth : UInt32

    /**
     * The row pitch, or width, or physical size, in bytes, of the subresource data.
     *             This must be a multiple of D3D12_TEXTURE_DATA_PITCH_ALIGNMENT (256), and must be greater than or equal to the size of the data within a row.
     */
    RowPitch : UInt32

}
