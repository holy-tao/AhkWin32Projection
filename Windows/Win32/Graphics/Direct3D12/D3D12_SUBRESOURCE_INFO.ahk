#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes subresource data. (D3D12_SUBRESOURCE_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_info
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SUBRESOURCE_INFO {
    #StructPack 8

    /**
     * Offset, in bytes, between the start of the parent resource and this subresource.
     */
    Offset : Int64

    /**
     * The row pitch, or width, or physical size, in bytes, of the subresource data.
     */
    RowPitch : UInt32

    /**
     * The depth pitch, or width, or physical size, in bytes, of the subresource data.
     */
    DepthPitch : UInt32

}
