#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapFrame.ahk
#Include .\IBitmapFrameWithSoftwareBitmap.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides read access to data within a single frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A read-only view of the metadata within the frame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.bitmapproperties
     * @type {BitmapPropertiesView} 
     */
    BitmapProperties {
        get => this.get_BitmapProperties()
    }

    /**
     * The pixel format that best fits the frame.
     * @remarks
     * This is the pixel format used when calling the [GetPixelDataAsync](bitmapframe_getpixeldataasync_1391309547.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.bitmappixelformat
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * The default alpha mode of the frame.
     * @remarks
     * This is the alpha mode used when calling the [GetPixelDataAsync](bitmapframe_getpixeldataasync_1391309547.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.bitmapalphamode
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * The horizontal resolution of the frame in dots per inch.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.dpix
     * @type {Float} 
     */
    DpiX {
        get => this.get_DpiX()
    }

    /**
     * The vertical resolution of the frame in dots per inch.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.dpiy
     * @type {Float} 
     */
    DpiY {
        get => this.get_DpiY()
    }

    /**
     * The width of the frame in pixels.
     * @remarks
     * If you need pixel dimensions of the image as it is natively stored, use the PixelWidth property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.pixelwidth
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * The height of the frame in pixels.
     * @remarks
     * If you need pixel dimensions of the image as it is natively stored, use the [PixelHeight](bitmapdecoder_pixelheight.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.pixelheight
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

    /**
     * The width of the frame in pixels, after any EXIF orientation has been applied to the bitmap.
     * @remarks
     * Use this property in the same way as OrientedPixelWidth is used if you need to know the width of an image or of pixel data.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.orientedpixelwidth
     * @type {Integer} 
     */
    OrientedPixelWidth {
        get => this.get_OrientedPixelWidth()
    }

    /**
     * The height of the frame in pixels, after any EXIF orientation has been applied to the bitmap.
     * @remarks
     * Use this property if you need to know the height of an image or of pixel data that has EXIF orientation applied, for example, if you call [GetPixelDataAsync](bitmapframe_getpixeldataasync_1391309547.md) and specify **RespectExifOrientation**. Also, the [HTML img element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) in Windows app using JavaScript, and [Windows.UI.Xaml.Controls.Image](../windows.ui.xaml.controls/image.md) respect EXIF orientation.
     * 
     * If you need pixel dimensions of the image as it is natively stored, use the [PixelHeight](bitmapdecoder_pixelheight.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.orientedpixelheight
     * @type {Integer} 
     */
    OrientedPixelHeight {
        get => this.get_OrientedPixelHeight()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously returns a stream containing the thumbnail image.
     * @remarks
     * Many image formats, like JPEG and TIFF, allow a small sized thumbnail of the full image to be embedded within a frame. If the image does not contain a thumbnail, then this operation will fail with HRESULT [WINCODEC_ERR_CODECNOTHUMBNAIL](/windows/desktop/wic/-wic-codec-error-codes). If it exists, the EXIF orientation flag on the frame is automatically applied to the thumbnail before it is returned.
     * @returns {IAsyncOperation<ImageStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.getthumbnailasync
     */
    GetThumbnailAsync() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.GetThumbnailAsync()
    }

    /**
     * 
     * @returns {BitmapPropertiesView} 
     */
    get_BitmapProperties() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_BitmapProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapPixelFormat() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_BitmapPixelFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapAlphaMode() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_BitmapAlphaMode()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiX() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_DpiX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiY() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_DpiY()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelWidth() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_PixelWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelHeight() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_PixelHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OrientedPixelWidth() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_OrientedPixelWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OrientedPixelHeight() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.get_OrientedPixelHeight()
    }

    /**
     * Asynchronously requests the pixel data for the frame. The resulting pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](bitmapframe_bitmappixelformat.md) and [BitmapAlphaMode](bitmapframe_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied (see the Remarks section for more information).
     * @remarks
     * The pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) and [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied.
     * 
     * As a convenience, this method performs color management from the frame's embedded color space (if it exists) to the sRGB color space. If there is no embedded color profile data, then no color management is performed. This method also attempts to read the EXIF orientation flag on the frame, and if it exists, will perform the necessary transformation to correctly orient the pixel data.
     * 
     * In order to retrieve the correct bitmap pixel width and height, the application should read the [OrientedPixelWidth](bitmapframe_orientedpixelwidth.md) and [OrientedPixelHeight](bitmapframe_orientedpixelheight.md) properties, instead of the [PixelWidth](bitmapframe_pixelwidth.md) and [PixelHeight](bitmapframe_pixelheight.md) properties.
     * 
     * This method is equivalent to calling the [GetPixelDataAsync(BitmapPixelFormat, BitmapAlphaMode, BitmapTransform, ExifOrientationMode, ColorManagementMode)](bitmapframe_getpixeldataasync_580908657.md) method with the following arguments:
     * 
     * | Argument | Value |
     * |---|---|
     * | *pixelFormat* | The value of the [BitmapPixelFormat](bitmapframe_bitmappixelformat.md) property. |
     * | *alphaMode* | The value of the [BitmapAlphaMode](bitmapframe_bitmapalphamode.md) property |
     * | *transform* | An empty transform. |
     * | *exifOrientationMode* | The [ExifOrientationMode](exiforientationmode.md) value **RespectExifOrientation**. |
     * | *colorManagementMode* | The [ColorManagementMode](colormanagementmode.md) value **ColorManageToSRgb**. |
     * @returns {IAsyncOperation<PixelDataProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.getpixeldataasync
     */
    GetPixelDataAsync() {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.GetPixelDataAsync()
    }

    /**
     * Asynchronously requests the pixel data for the frame. The resulting pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](bitmapframe_bitmappixelformat.md) and [BitmapAlphaMode](bitmapframe_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied (see the Remarks section for more information).
     * @remarks
     * The pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) and [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied.
     * 
     * As a convenience, this method performs color management from the frame's embedded color space (if it exists) to the sRGB color space. If there is no embedded color profile data, then no color management is performed. This method also attempts to read the EXIF orientation flag on the frame, and if it exists, will perform the necessary transformation to correctly orient the pixel data.
     * 
     * In order to retrieve the correct bitmap pixel width and height, the application should read the [OrientedPixelWidth](bitmapframe_orientedpixelwidth.md) and [OrientedPixelHeight](bitmapframe_orientedpixelheight.md) properties, instead of the [PixelWidth](bitmapframe_pixelwidth.md) and [PixelHeight](bitmapframe_pixelheight.md) properties.
     * 
     * This method is equivalent to calling the [GetPixelDataAsync(BitmapPixelFormat, BitmapAlphaMode, BitmapTransform, ExifOrientationMode, ColorManagementMode)](bitmapframe_getpixeldataasync_580908657.md) method with the following arguments:
     * 
     * | Argument | Value |
     * |---|---|
     * | *pixelFormat* | The value of the [BitmapPixelFormat](bitmapframe_bitmappixelformat.md) property. |
     * | *alphaMode* | The value of the [BitmapAlphaMode](bitmapframe_bitmapalphamode.md) property |
     * | *transform* | An empty transform. |
     * | *exifOrientationMode* | The [ExifOrientationMode](exiforientationmode.md) value **RespectExifOrientation**. |
     * | *colorManagementMode* | The [ColorManagementMode](colormanagementmode.md) value **ColorManageToSRgb**. |
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {BitmapTransform} transform_ 
     * @param {Integer} exifOrientationMode_ 
     * @param {Integer} colorManagementMode_ 
     * @returns {IAsyncOperation<PixelDataProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.getpixeldataasync
     */
    GetPixelDataTransformedAsync(pixelFormat, alphaMode, transform_, exifOrientationMode_, colorManagementMode_) {
        if (!this.HasProp("__IBitmapFrame")) {
            if ((queryResult := this.QueryInterface(IBitmapFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrame := IBitmapFrame(outPtr)
        }

        return this.__IBitmapFrame.GetPixelDataTransformedAsync(pixelFormat, alphaMode, transform_, exifOrientationMode_, colorManagementMode_)
    }

    /**
     * Asynchronously gets a [SoftwareBitmap](softwarebitmap.md) representation of the bitmap frame.
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.getsoftwarebitmapasync
     */
    GetSoftwareBitmapAsync() {
        if (!this.HasProp("__IBitmapFrameWithSoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(IBitmapFrameWithSoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrameWithSoftwareBitmap := IBitmapFrameWithSoftwareBitmap(outPtr)
        }

        return this.__IBitmapFrameWithSoftwareBitmap.GetSoftwareBitmapAsync()
    }

    /**
     * Asynchronously gets a [SoftwareBitmap](softwarebitmap.md) representation of the bitmap frame.
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.getsoftwarebitmapasync
     */
    GetSoftwareBitmapConvertedAsync(pixelFormat, alphaMode) {
        if (!this.HasProp("__IBitmapFrameWithSoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(IBitmapFrameWithSoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrameWithSoftwareBitmap := IBitmapFrameWithSoftwareBitmap(outPtr)
        }

        return this.__IBitmapFrameWithSoftwareBitmap.GetSoftwareBitmapConvertedAsync(pixelFormat, alphaMode)
    }

    /**
     * Asynchronously gets a [SoftwareBitmap](softwarebitmap.md) representation of the bitmap frame.
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {BitmapTransform} transform_ 
     * @param {Integer} exifOrientationMode_ 
     * @param {Integer} colorManagementMode_ 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapframe.getsoftwarebitmapasync
     */
    GetSoftwareBitmapTransformedAsync(pixelFormat, alphaMode, transform_, exifOrientationMode_, colorManagementMode_) {
        if (!this.HasProp("__IBitmapFrameWithSoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(IBitmapFrameWithSoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapFrameWithSoftwareBitmap := IBitmapFrameWithSoftwareBitmap(outPtr)
        }

        return this.__IBitmapFrameWithSoftwareBitmap.GetSoftwareBitmapTransformedAsync(pixelFormat, alphaMode, transform_, exifOrientationMode_, colorManagementMode_)
    }

;@endregion Instance Methods
}
