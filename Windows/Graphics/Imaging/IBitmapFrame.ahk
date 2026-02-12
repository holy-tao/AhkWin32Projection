#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ImageStream.ahk
#Include .\BitmapPropertiesView.ahk
#Include .\PixelDataProvider.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods for operating on a single frame of an image.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapFrame
     * @type {Guid}
     */
    static IID => Guid("{72a49a1c-8081-438d-91bc-94ecfc8185c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnailAsync", "get_BitmapProperties", "get_BitmapPixelFormat", "get_BitmapAlphaMode", "get_DpiX", "get_DpiY", "get_PixelWidth", "get_PixelHeight", "get_OrientedPixelWidth", "get_OrientedPixelHeight", "GetPixelDataAsync", "GetPixelDataTransformedAsync"]

    /**
     * Returns a read-only view of the metadata within the frame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.bitmapproperties
     * @type {BitmapPropertiesView} 
     */
    BitmapProperties {
        get => this.get_BitmapProperties()
    }

    /**
     * Returns the default pixel format of the frame.
     * @remarks
     * This is the pixel format used when calling the [GetPixelDataAsync](ibitmapframe_getpixeldataasync_1391309547.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.bitmappixelformat
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * Returns the default alpha mode of the frame.
     * @remarks
     * This is the alpha mode used when calling the [GetPixelDataAsync](ibitmapframe_getpixeldataasync_1391309547.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.bitmapalphamode
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * Returns the horizontal resolution of the frame in dots per inch.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.dpix
     * @type {Float} 
     */
    DpiX {
        get => this.get_DpiX()
    }

    /**
     * Returns the vertical resolution of the frame in dots per inch.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.dpiy
     * @type {Float} 
     */
    DpiY {
        get => this.get_DpiY()
    }

    /**
     * Returns the width of the frame in pixels.
     * @remarks
     * This property ignores any EXIF orientation flag value.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.pixelwidth
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * Returns the height of the frame in pixels.
     * @remarks
     * This property ignores any EXIF orientation flag value.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.pixelheight
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

    /**
     * Returns the width of the frame in pixels, after any EXIF orientation has been applied to the bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.orientedpixelwidth
     * @type {Integer} 
     */
    OrientedPixelWidth {
        get => this.get_OrientedPixelWidth()
    }

    /**
     * Returns the height of the frame in pixels, after any EXIF orientation has been applied to the bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.orientedpixelheight
     * @type {Integer} 
     */
    OrientedPixelHeight {
        get => this.get_OrientedPixelHeight()
    }

    /**
     * Asynchronously retrieves the thumbnail data for the frame.
     * @returns {IAsyncOperation<ImageStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.getthumbnailasync
     */
    GetThumbnailAsync() {
        result := ComCall(6, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ImageStream, asyncInfo)
    }

    /**
     * 
     * @returns {BitmapPropertiesView} 
     */
    get_BitmapProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapPropertiesView(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapPixelFormat() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapAlphaMode() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiX() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiY() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelWidth() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelHeight() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OrientedPixelWidth() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OrientedPixelHeight() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Asynchronously requests the pixel data for the frame. The resulting pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](ibitmapframe_bitmappixelformat.md) and [BitmapAlphaMode](ibitmapframe_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied (see the Remarks section for more information).
     * @remarks
     * An application should not assume that pixel data returned by this method uses any particular pixel format or alpha mode (i.e. Rgba8 with premultiplied alpha). Instead, it should always check the [BitmapPixelFormat](ibitmapframe_bitmappixelformat.md) and [BitmapAlphaMode](ibitmapframe_bitmapalphamode.md) properties and handle the data accordingly.
     * 
     * As a convenience, this method performs color management from the frame’s embedded color space (if it exists) to the sRGB color space. If there is no embedded color profile data, then no color management is performed. This method also attempts to read the EXIF orientation flag on the frame, and if it exists, will perform the necessary transformation to correctly orient the pixel data.
     * 
     * In order to retrieve the correct bitmap pixel width and height, the application should read the [OrientedPixelWidth](ibitmapframe_orientedpixelwidth.md) and [OrientedPixelHeight](ibitmapframe_orientedpixelheight.md) properties, instead of the [PixelWidth](ibitmapframe_pixelwidth.md) and [PixelHeight](ibitmapframe_pixelheight.md) properties.
     * 
     * This method is equivalent to calling the [GetPixelDataAsync(BitmapPixelFormat, BitmapAlphaMode, BitmapTransform, ExifOrientationMode, ColorManagementMode)](bitmapframe_getpixeldataasync_580908657.md) method with the following arguments:<table>
     *    <tr><th>Argument</th><th>Value</th></tr>
     *    <tr><td>*pixelFormat*</td><td>The value of the [BitmapPixelFormat](ibitmapframe_bitmappixelformat.md) property.</td></tr>
     *    <tr><td>*alphaMode*</td><td>The value of the [BitmapAlphaMode](ibitmapframe_bitmapalphamode.md) property</td></tr>
     *    <tr><td>*transform*</td><td>An empty transform.</td></tr>
     *    <tr><td>*exifOrientationMode*</td><td>The [ExifOrientationMode](exiforientationmode.md) value **RespectExifOrientation**.</td></tr>
     *    <tr><td>*colorManagementMode*</td><td>The [ColorManagementMode](colormanagementmode.md) value **ColorManageToSRgb**.</td></tr>
     * </table>
     * @returns {IAsyncOperation<PixelDataProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.getpixeldataasync
     */
    GetPixelDataAsync() {
        result := ComCall(16, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PixelDataProvider, asyncInfo)
    }

    /**
     * Asynchronously requests the pixel data for the frame. The resulting pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](ibitmapframe_bitmappixelformat.md) and [BitmapAlphaMode](ibitmapframe_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied (see the Remarks section for more information).
     * @remarks
     * An application should not assume that pixel data returned by this method uses any particular pixel format or alpha mode (i.e. Rgba8 with premultiplied alpha). Instead, it should always check the [BitmapPixelFormat](ibitmapframe_bitmappixelformat.md) and [BitmapAlphaMode](ibitmapframe_bitmapalphamode.md) properties and handle the data accordingly.
     * 
     * As a convenience, this method performs color management from the frame’s embedded color space (if it exists) to the sRGB color space. If there is no embedded color profile data, then no color management is performed. This method also attempts to read the EXIF orientation flag on the frame, and if it exists, will perform the necessary transformation to correctly orient the pixel data.
     * 
     * In order to retrieve the correct bitmap pixel width and height, the application should read the [OrientedPixelWidth](ibitmapframe_orientedpixelwidth.md) and [OrientedPixelHeight](ibitmapframe_orientedpixelheight.md) properties, instead of the [PixelWidth](ibitmapframe_pixelwidth.md) and [PixelHeight](ibitmapframe_pixelheight.md) properties.
     * 
     * This method is equivalent to calling the [GetPixelDataAsync(BitmapPixelFormat, BitmapAlphaMode, BitmapTransform, ExifOrientationMode, ColorManagementMode)](bitmapframe_getpixeldataasync_580908657.md) method with the following arguments:<table>
     *    <tr><th>Argument</th><th>Value</th></tr>
     *    <tr><td>*pixelFormat*</td><td>The value of the [BitmapPixelFormat](ibitmapframe_bitmappixelformat.md) property.</td></tr>
     *    <tr><td>*alphaMode*</td><td>The value of the [BitmapAlphaMode](ibitmapframe_bitmapalphamode.md) property</td></tr>
     *    <tr><td>*transform*</td><td>An empty transform.</td></tr>
     *    <tr><td>*exifOrientationMode*</td><td>The [ExifOrientationMode](exiforientationmode.md) value **RespectExifOrientation**.</td></tr>
     *    <tr><td>*colorManagementMode*</td><td>The [ColorManagementMode](colormanagementmode.md) value **ColorManageToSRgb**.</td></tr>
     * </table>
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {BitmapTransform} transform_ 
     * @param {Integer} exifOrientationMode_ 
     * @param {Integer} colorManagementMode_ 
     * @returns {IAsyncOperation<PixelDataProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmapframe.getpixeldataasync
     */
    GetPixelDataTransformedAsync(pixelFormat, alphaMode, transform_, exifOrientationMode_, colorManagementMode_) {
        result := ComCall(17, this, "int", pixelFormat, "int", alphaMode, "ptr", transform_, "int", exifOrientationMode_, "int", colorManagementMode_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PixelDataProvider, asyncInfo)
    }
}
