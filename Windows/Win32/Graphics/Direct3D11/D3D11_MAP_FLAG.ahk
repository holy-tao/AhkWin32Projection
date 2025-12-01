#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the CPU should respond when an application calls the ID3D11DeviceContext::Map method on a resource that is being used by the GPU.
 * @remarks
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">ID3D11DeviceContext::Map</a>.
 * 
 * D3D11_MAP_FLAG_DO_NOT_WAIT cannot be used with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP_WRITE_DISCARD</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_map">D3D11_MAP_WRITE_NOOVERWRITE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_map_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_MAP_FLAG extends Win32Enum{

    /**
     * Specifies that <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">ID3D11DeviceContext::Map</a> should return DXGI_ERROR_WAS_STILL_DRAWING when the GPU blocks the CPU from accessing a resource. For more information about this error code, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_MAP_FLAG_DO_NOT_WAIT => 1048576
}
