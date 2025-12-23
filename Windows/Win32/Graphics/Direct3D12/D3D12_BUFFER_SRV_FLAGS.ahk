#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies how to view a buffer resource. (D3D12_BUFFER_SRV_FLAGS)
 * @remarks
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_buffer_srv">D3D12_BUFFER_SRV</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_buffer_srv_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUFFER_SRV_FLAGS extends Win32BitflagEnum{

    /**
     * Indicates a default view.
     * @type {Integer (Int32)}
     */
    static D3D12_BUFFER_SRV_FLAG_NONE => 0

    /**
     * View the buffer as raw. For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_BUFFER_SRV_FLAG_RAW => 1
}
