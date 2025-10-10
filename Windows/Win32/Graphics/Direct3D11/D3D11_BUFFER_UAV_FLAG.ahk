#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies unordered-access view options for a buffer resource.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_buffer_uav_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BUFFER_UAV_FLAG{

    /**
     * Resource contains raw, unstructured data.  Requires the UAV format to be DXGI_FORMAT_R32_TYPELESS.
 *         For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_BUFFER_UAV_FLAG_RAW => 1

    /**
     * Allow data to be appended to the end of the buffer.  <b>D3D11_BUFFER_UAV_FLAG_APPEND</b> flag must also be used for 
 *         any view that will be used as a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-appendstructuredbuffer">AppendStructuredBuffer</a> or a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-consumestructuredbuffer">ConsumeStructuredBuffer</a>. 
 *         Requires the UAV format to be DXGI_FORMAT_UNKNOWN.
     * @type {Integer (Int32)}
     */
    static D3D11_BUFFER_UAV_FLAG_APPEND => 2

    /**
     * Adds a counter to the unordered-access-view buffer.  <b>D3D11_BUFFER_UAV_FLAG_COUNTER</b> can only be used on a UAV that is a 
 *         <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-rwstructuredbuffer">RWStructuredBuffer</a> and it enables the functionality needed for the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-rwstructuredbuffer-incrementcounter">IncrementCounter</a>and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-rwstructuredbuffer-decrementcounter">DecrementCounter</a> methods in HLSL.  Requires the UAV format to be DXGI_FORMAT_UNKNOWN.
     * @type {Integer (Int32)}
     */
    static D3D11_BUFFER_UAV_FLAG_COUNTER => 4
}
