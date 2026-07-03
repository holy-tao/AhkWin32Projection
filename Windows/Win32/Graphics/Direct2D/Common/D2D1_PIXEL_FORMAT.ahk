#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_ALPHA_MODE.ahk" { D2D1_ALPHA_MODE }
#Import "..\..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Contains the data format and alpha mode for a bitmap or render target.
 * @remarks
 * For more information about the pixel formats and alpha modes supported by each render target, see <a href="https://docs.microsoft.com/windows/desktop/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D1_PIXEL_FORMAT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A value that specifies the size and arrangement of channels in each pixel.
     */
    format : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a></b>
     * 
     * A value that specifies whether the alpha channel is using pre-multiplied alpha, straight alpha, whether it should be ignored and considered opaque, or whether it is unknown.
     */
    alphaMode : D2D1_ALPHA_MODE

}
