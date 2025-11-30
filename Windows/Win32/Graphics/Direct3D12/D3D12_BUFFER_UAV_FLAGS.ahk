#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies unordered-access view options for a buffer resource.
 * @remarks
 * 
 * This enum is used in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_buffer_uav">D3D12_BUFFER_UAV</a>  structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_buffer_uav_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUFFER_UAV_FLAGS extends Win32BitflagEnum{

    /**
     * Indicates a default view.
     * @type {Integer (Int32)}
     */
    static D3D12_BUFFER_UAV_FLAG_NONE => 0

    /**
     * Resource contains raw, unstructured data.  Requires the UAV format to be <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R32_TYPELESS</a>.
     *             For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_BUFFER_UAV_FLAG_RAW => 1
}
