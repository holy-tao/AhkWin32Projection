#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the data format and alpha mode for a bitmap or render target.
 * @remarks
 * For more information about the pixel formats and alpha modes supported by each render target, see <a href="https://docs.microsoft.com/windows/desktop/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_PIXEL_FORMAT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A value that specifies the size and arrangement of channels in each pixel.
     * @type {Integer}
     */
    format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a></b>
     * 
     * A value that specifies whether the alpha channel is using pre-multiplied alpha, straight alpha, whether it should be ignored and considered opaque, or whether it is unknown.
     * @type {Integer}
     */
    alphaMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
