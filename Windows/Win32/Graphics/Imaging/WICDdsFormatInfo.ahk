#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the DXGI_FORMAT and block information of a DDS format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicddsformatinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICDdsFormatInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>
     * @type {Integer}
     */
    DxgiFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The size of a single block in bytes. For <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> values that are not block-based, the value is equal to the size of a single pixel in bytes.
     * @type {Integer}
     */
    BytesPerBlock {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The width of a single block in pixels. For <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> values that are not block-based, the value is 1.
     * @type {Integer}
     */
    BlockWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The height of a single block in pixels. For <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> values that are not block-based, the value is 1.
     * @type {Integer}
     */
    BlockHeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
