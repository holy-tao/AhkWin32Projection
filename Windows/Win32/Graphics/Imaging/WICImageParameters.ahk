#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct2D\Common\D2D1_ALPHA_MODE.ahk" { D2D1_ALPHA_MODE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\Direct2D\Common\D2D1_PIXEL_FORMAT.ahk" { D2D1_PIXEL_FORMAT }

/**
 * This defines parameters that you can use to override the default parameters normally used when encoding an image.
 * @remarks
 * If this parameter is not passed to the encoding API, the encoder uses these settings.
 * 
 * <ul>
 * <li>A pixel format of (<a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_PREMULTIPLIED</a>).</li>
 * <li>An x and y DPI of 96.</li>
 * <li>The entire image bounds will be used for encoding.</li>
 * </ul>
 * <div class="alert"><b>Note</b>  The parameters as specified can't result in a scale. The encoder can use a larger portion of the input image based on the passed in DPI and the pixel width and height.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicimageparameters
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICImageParameters {
    #StructPack 4

    /**
     * The pixel format to which the image is processed before it is written to the encoder.
     */
    PixelFormat : D2D1_PIXEL_FORMAT

    /**
     * The DPI in the x dimension.
     */
    DpiX : Float32

    /**
     * The DPI in the y dimension.
     */
    DpiY : Float32

    /**
     * The top corner in pixels of the image space to be encoded to the destination.
     */
    Top : Float32

    /**
     * The left corner in pixels of the image space to be encoded to the destination.
     */
    Left : Float32

    /**
     * The width in pixels of the part of the image to write.
     */
    PixelWidth : UInt32

    /**
     * The height in pixels of the part of the image to write.
     */
    PixelHeight : UInt32

}
