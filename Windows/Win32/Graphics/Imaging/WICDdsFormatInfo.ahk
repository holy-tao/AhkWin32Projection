#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Specifies the DXGI_FORMAT and block information of a DDS format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicddsformatinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICDdsFormatInfo {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>
     */
    DxgiFormat : DXGI_FORMAT

    /**
     * Type: <b>UINT</b>
     * 
     * The size of a single block in bytes. For <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> values that are not block-based, the value is equal to the size of a single pixel in bytes.
     */
    BytesPerBlock : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The width of a single block in pixels. For <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> values that are not block-based, the value is 1.
     */
    BlockWidth : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The height of a single block in pixels. For <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> values that are not block-based, the value is 1.
     */
    BlockHeight : UInt32

}
