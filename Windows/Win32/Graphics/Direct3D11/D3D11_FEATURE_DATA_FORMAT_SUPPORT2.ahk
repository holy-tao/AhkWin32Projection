#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes which unordered resource options are supported by the current graphics driver for a given format.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_format_support2
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_FORMAT_SUPPORT2 {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> to return information on.
     */
    InFormat : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_format_support2">D3D11_FORMAT_SUPPORT2</a> flags indicating which unordered resource options are supported.
     */
    OutFormatSupport2 : UInt32

}
