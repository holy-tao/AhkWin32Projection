#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies whether conservative rasterization is on or off.
 * @remarks
 * 
  * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_rasterizer_desc">D3D12_RASTERIZER_DESC</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_conservative_rasterization_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_CONSERVATIVE_RASTERIZATION_MODE{

    /**
     * Conservative rasterization is off.
     * @type {Integer (Int32)}
     */
    static D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF => 0

    /**
     * Conservative rasterization is on.
     * @type {Integer (Int32)}
     */
    static D3D12_CONSERVATIVE_RASTERIZATION_MODE_ON => 1
}
