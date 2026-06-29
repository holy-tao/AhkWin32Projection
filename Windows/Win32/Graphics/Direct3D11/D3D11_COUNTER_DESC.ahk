#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_COUNTER.ahk" { D3D11_COUNTER }

/**
 * Describes a counter. (D3D11_COUNTER_DESC)
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11counter-getdesc">ID3D11Counter::GetDesc</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkcounter">ID3D11Device::CheckCounter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createcounter">ID3D11Device::CreateCounter</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_counter_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_COUNTER_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_counter">D3D11_COUNTER</a></b>
     * 
     * Type of counter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_counter">D3D11_COUNTER</a>).
     */
    Counter : D3D11_COUNTER

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved.
     */
    MiscFlags : UInt32

}
