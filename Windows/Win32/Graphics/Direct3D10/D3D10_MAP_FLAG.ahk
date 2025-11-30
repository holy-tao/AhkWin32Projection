#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the CPU should respond when Map is called on a resource being used by the GPU.
 * @remarks
 * 
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10buffer-map">ID3D10Buffer::Map</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10texture1d-map">ID3D10Texture1D::Map</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10texture2d-map">ID3D10Texture2D::Map</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10texture3d-map">ID3D10Texture3D::Map</a>.
 * 
 * D3D10_MAP_FLAG_DO_NOT_WAIT cannot be used with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP_WRITE_DISCARD</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP_WRITE_NOOVERWRITE</a>.
 * 
 * For more information about potential conflicts between the GPU and CPU during resource mapping, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">Copying and Accessing Resource Data (Direct3D 10)</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_map_flag
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_MAP_FLAG extends Win32Enum{

    /**
     * Specifies that Map should return <b>DXGI_ERROR_WAS_STILL_DRAWING</b> when the GPU blocks the CPU from accessing a resource.
     * @type {Integer (Int32)}
     */
    static D3D10_MAP_FLAG_DO_NOT_WAIT => 1048576
}
