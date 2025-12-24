#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Direct2D\Common\D2D1_PIXEL_FORMAT.ahk

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
 * @version v4.0.30319
 */
class WICImageParameters extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The pixel format to which the image is processed before it is written to the encoder.
     * @type {D2D1_PIXEL_FORMAT}
     */
    PixelFormat{
        get {
            if(!this.HasProp("__PixelFormat"))
                this.__PixelFormat := D2D1_PIXEL_FORMAT(0, this)
            return this.__PixelFormat
        }
    }

    /**
     * The DPI in the x dimension.
     * @type {Float}
     */
    DpiX {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The DPI in the y dimension.
     * @type {Float}
     */
    DpiY {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The top corner in pixels of the image space to be encoded to the destination.
     * @type {Float}
     */
    Top {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * The left corner in pixels of the image space to be encoded to the destination.
     * @type {Float}
     */
    Left {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * The width in pixels of the part of the image to write.
     * @type {Integer}
     */
    PixelWidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The height in pixels of the part of the image to write.
     * @type {Integer}
     */
    PixelHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
