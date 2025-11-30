#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies how to view a buffer resource.
 * @remarks
 * 
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_bufferex_srv">D3D11_BUFFEREX_SRV</a>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_bufferex_srv_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BUFFEREX_SRV_FLAG extends Win32Enum{

    /**
     * View the buffer as raw. For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_BUFFEREX_SRV_FLAG_RAW => 1
}
