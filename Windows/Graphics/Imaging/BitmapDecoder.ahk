#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapDecoder.ahk
#Include .\IBitmapFrame.ahk
#Include .\IBitmapFrameWithSoftwareBitmap.ahk
#Include .\IBitmapDecoderStatics2.ahk
#Include .\IBitmapDecoderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides read access to bitmap container data as well as data from the first frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapDecoder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapDecoder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapDecoder.IID

    /**
     * The unique identifier of the HEIF decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.heifdecoderid
     * @type {Guid} 
     */
    static HeifDecoderId {
        get => BitmapDecoder.get_HeifDecoderId()
    }

    /**
     * The unique identifier of the WebP decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.webpdecoderid
     * @type {Guid} 
     */
    static WebpDecoderId {
        get => BitmapDecoder.get_WebpDecoderId()
    }

    /**
     * The unique identifier of the BMP decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.bmpdecoderid
     * @type {Guid} 
     */
    static BmpDecoderId {
        get => BitmapDecoder.get_BmpDecoderId()
    }

    /**
     * The unique identifier of the JPEG decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.jpegdecoderid
     * @type {Guid} 
     */
    static JpegDecoderId {
        get => BitmapDecoder.get_JpegDecoderId()
    }

    /**
     * The unique identifier of the PNG decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.pngdecoderid
     * @type {Guid} 
     */
    static PngDecoderId {
        get => BitmapDecoder.get_PngDecoderId()
    }

    /**
     * The unique identifier of the TIFF decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.tiffdecoderid
     * @type {Guid} 
     */
    static TiffDecoderId {
        get => BitmapDecoder.get_TiffDecoderId()
    }

    /**
     * The unique identifier of the GIF decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.gifdecoderid
     * @type {Guid} 
     */
    static GifDecoderId {
        get => BitmapDecoder.get_GifDecoderId()
    }

    /**
     * The unique identifier of the JPEG-XR decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.jpegxrdecoderid
     * @type {Guid} 
     */
    static JpegXRDecoderId {
        get => BitmapDecoder.get_JpegXRDecoderId()
    }

    /**
     * The unique identifier of the ICO decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.icodecoderid
     * @type {Guid} 
     */
    static IcoDecoderId {
        get => BitmapDecoder.get_IcoDecoderId()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Guid} 
     */
    static get_HeifDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics2.IID)
            BitmapDecoder.__IBitmapDecoderStatics2 := IBitmapDecoderStatics2(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics2.get_HeifDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_WebpDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics2.IID)
            BitmapDecoder.__IBitmapDecoderStatics2 := IBitmapDecoderStatics2(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics2.get_WebpDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BmpDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.get_BmpDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_JpegDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.get_JpegDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_PngDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.get_PngDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TiffDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.get_TiffDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GifDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.get_GifDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_JpegXRDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.get_JpegXRDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_IcoDecoderId() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.get_IcoDecoderId()
    }

    /**
     * The bitmap decoders installed on the system and information about them.
     * @returns {IVectorView<BitmapCodecInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getdecoderinformationenumerator
     */
    static GetDecoderInformationEnumerator() {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.GetDecoderInformationEnumerator()
    }

    /**
     * Asynchronously creates a new [BitmapDecoder](bitmapdecoder.md) using a specific bitmap codec and initializes it using a stream.
     * @remarks
     * This method allows the application to explicitly select the bitmap decoder to be used and bypass any automatic codec arbitration. The unique identifiers of the built-in decoders are available as properties on [BitmapDecoder](bitmapdecoder.md). In addition, the unique identifier of any installed decoder can be obtained using the [GetDecoderInformationEnumerator](bitmapdecoder_getdecoderinformationenumerator_1302740057.md) method.
     * @param {IRandomAccessStream} stream The stream containing the image file to be decoded.
     * @returns {IAsyncOperation<BitmapDecoder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.createasync
     */
    static CreateAsync(stream) {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.CreateAsync(stream)
    }

    /**
     * Asynchronously creates a new [BitmapDecoder](bitmapdecoder.md) and initializes it using a stream.
     * @remarks
     * [Windows.Graphics.Imaging](windows_graphics_imaging.md) automatically determines the correct bitmap decoder to decode the stream.
     * @param {Guid} decoderId 
     * @param {IRandomAccessStream} stream The stream containing the image file to be decoded.
     * @returns {IAsyncOperation<BitmapDecoder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.createasync
     */
    static CreateWithIdAsync(decoderId, stream) {
        if (!BitmapDecoder.HasProp("__IBitmapDecoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapDecoderStatics.IID)
            BitmapDecoder.__IBitmapDecoderStatics := IBitmapDecoderStatics(factoryPtr)
        }

        return BitmapDecoder.__IBitmapDecoderStatics.CreateWithIdAsync(decoderId, stream)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Provides access to the container bitmap properties.
     * @remarks
     * Many image file formats do not have container level metadata.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.bitmapcontainerproperties
     * @type {BitmapPropertiesView} 
     */
    BitmapContainerProperties {
        get => this.get_BitmapContainerProperties()
    }

    /**
     * Information about the bitmap decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.decoderinformation
     * @type {BitmapCodecInformation} 
     */
    DecoderInformation {
        get => this.get_DecoderInformation()
    }

    /**
     * The number of frames within the image file.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.framecount
     * @type {Integer} 
     */
    FrameCount {
        get => this.get_FrameCount()
    }

    /**
     * A read-only view of the metadata within the first frame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.bitmapproperties
     * @type {BitmapPropertiesView} 
     */
    BitmapProperties {
        get => this.get_BitmapProperties()
    }

    /**
     * The pixel format that best fits the first frame.
     * @remarks
     * This is the pixel format used when calling the [GetPixelDataAsync](bitmapdecoder_getpixeldataasync_1391309547.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.bitmappixelformat
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * The default alpha mode of the first frame.
     * @remarks
     * This is the alpha mode used when calling the [GetPixelDataAsync](bitmapdecoder_getpixeldataasync_1391309547.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.bitmapalphamode
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * The horizontal resolution of the first frame in dots per inch.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.dpix
     * @type {Float} 
     */
    DpiX {
        get => this.get_DpiX()
    }

    /**
     * The vertical resolution of the first frame in dots per inch.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.dpiy
     * @type {Float} 
     */
    DpiY {
        get => this.get_DpiY()
    }

    /**
     * The width of the first frame in pixels.
     * @remarks
     * Use PixelWidth for pixel dimensions of the image as it is natively stored.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.pixelwidth
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * The height of the first frame in pixels.
     * @remarks
     * Use PixelHeight for pixel dimensions of the image as it is natively stored.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.pixelheight
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

    /**
     * The width of the first frame in pixels, after any EXIF orientation has been applied to the bitmap.
     * @remarks
     * Use this property in the same way as [OrientedPixelHeight](bitmapdecoder_orientedpixelheight.md) is used if you need to know the width of an image or of pixel data.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.orientedpixelwidth
     * @type {Integer} 
     */
    OrientedPixelWidth {
        get => this.get_OrientedPixelWidth()
    }

    /**
     * The height of the first frame in pixels, after any EXIF orientation has been applied to the bitmap.
     * @remarks
     * Use this property if you need to know the height of an image or of pixel data that has EXIF orientation applied, for example, if you call [GetPixelDataAsync](bitmapdecoder_getpixeldataasync_1391309547.md) and specify **RespectExifOrientation**. Also, the [HTML img element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) in Windows app using JavaScript, and [Windows.UI.Xaml.Controls.Image](../windows.ui.xaml.controls/image.md) respect EXIF orientation.
     * 
     * If you need pixel dimensions of the image as it is natively stored, use the [PixelHeight](bitmapdecoder_pixelheight.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.orientedpixelheight
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
     * 
     * @returns {BitmapPropertiesView} 
     */
    get_BitmapContainerProperties() {
        if (!this.HasProp("__IBitmapDecoder")) {
            if ((queryResult := this.QueryInterface(IBitmapDecoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapDecoder := IBitmapDecoder(outPtr)
        }

        return this.__IBitmapDecoder.get_BitmapContainerProperties()
    }

    /**
     * 
     * @returns {BitmapCodecInformation} 
     */
    get_DecoderInformation() {
        if (!this.HasProp("__IBitmapDecoder")) {
            if ((queryResult := this.QueryInterface(IBitmapDecoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapDecoder := IBitmapDecoder(outPtr)
        }

        return this.__IBitmapDecoder.get_DecoderInformation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameCount() {
        if (!this.HasProp("__IBitmapDecoder")) {
            if ((queryResult := this.QueryInterface(IBitmapDecoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapDecoder := IBitmapDecoder(outPtr)
        }

        return this.__IBitmapDecoder.get_FrameCount()
    }

    /**
     * Asynchronously returns a stream containing the preview image.
     * @remarks
     * Some image formats, like JPEG-XR and camera RAW formats, contain an image preview. The preview is generally higher resolution than a thumbnail. This is an advantage because decoding the preview can be faster than decoding the full RAW image, but provides comparable fidelity when displaying images
     * 
     * If the image does not contain a preview, this operation fails with HRESULT [WINCODEC_ERR_UNSUPPORTEDOPERATION](/windows/desktop/wic/-wic-codec-error-codes).
     * @returns {IAsyncOperation<ImageStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getpreviewasync
     */
    GetPreviewAsync() {
        if (!this.HasProp("__IBitmapDecoder")) {
            if ((queryResult := this.QueryInterface(IBitmapDecoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapDecoder := IBitmapDecoder(outPtr)
        }

        return this.__IBitmapDecoder.GetPreviewAsync()
    }

    /**
     * Asynchronously retrieves a frame from the image file.
     * @remarks
     * You don't need to use this method to access data from the first frame in an image file. [BitmapDecoder](bitmapdecoder.md) already provides a method to access the first frame.
     * 
     * You can get the total number of frames on the image using the [FrameCount](bitmapdecoder_framecount.md) property.
     * @param {Integer} frameIndex The zero-based index of the frame to be retrieved.
     * @returns {IAsyncOperation<BitmapFrame>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getframeasync
     */
    GetFrameAsync(frameIndex) {
        if (!this.HasProp("__IBitmapDecoder")) {
            if ((queryResult := this.QueryInterface(IBitmapDecoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapDecoder := IBitmapDecoder(outPtr)
        }

        return this.__IBitmapDecoder.GetFrameAsync(frameIndex)
    }

    /**
     * Asynchronously returns a stream containing the thumbnail image.
     * @remarks
     * Many image formats, like JPEG and TIFF, allow a small sized thumbnail of the full image to be embedded within a frame. If the image does not contain a thumbnail, then this operation will fail with HRESULT [WINCODEC_ERR_CODECNOTHUMBNAIL](/windows/desktop/wic/-wic-codec-error-codes). If it exists, the EXIF orientation flag on the frame is automatically applied to the thumbnail before it is returned.
     * @returns {IAsyncOperation<ImageStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getthumbnailasync
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
     * Asynchronously requests the pixel data for the frame.
     * @remarks
     * The pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) and [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied.
     * 
     * An application should not assume that pixel data returned by this method uses any particular pixel format or alpha mode (like Rgba8 with premultiplied alpha). Instead, it should always check the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) and [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) properties and handle the data accordingly.
     * 
     * As a convenience, this method performs color management from the frame's embedded color space (if it exists) to the sRGB color space. If there is no embedded color profile data, then no color management is performed. This method also attempts to read the EXIF orientation flag on the frame, and if it exists, will perform the necessary transformation to correctly orient the pixel data.
     * 
     * In order to retrieve the correct bitmap pixel width and height, the application should read the [OrientedPixelWidth](bitmapdecoder_orientedpixelwidth.md) and [OrientedPixelHeight](bitmapdecoder_orientedpixelheight.md) properties, instead of the [PixelWidth](bitmapdecoder_pixelwidth.md) and [PixelHeight](bitmapdecoder_pixelheight.md) properties.
     * 
     * This method is equivalent to calling the [GetPixelDataAsync(BitmapPixelFormat, BitmapAlphaMode, BitmapTransform, ExifOrientationMode, ColorManagementMode)](bitmapdecoder_getpixeldataasync_580908657.md) method with the following arguments:
     * 
     * | Argument | Value |
     * |---|---|
     * | *pixelFormat* | The value of the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) property. |
     * | *alphaMode* | The value of the [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) property |
     * | *transform* | A new [BitmapTransform](bitmaptransform.md). |
     * | *exifOrientationMode* | The [ExifOrientationMode](exiforientationmode.md) value **RespectExifOrientation**. |
     * | *colorManagementMode* | The [ColorManagementMode](colormanagementmode.md) value **ColorManageToSRgb**. |
     * @returns {IAsyncOperation<PixelDataProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getpixeldataasync
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
     * Asynchronously requests the pixel data for the frame.
     * @remarks
     * The pixel data array will use the bitmap pixel format and alpha mode specified in the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) and [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) properties. It will also have color management and EXIF orientation applied.
     * 
     * An application should not assume that pixel data returned by this method uses any particular pixel format or alpha mode (like Rgba8 with premultiplied alpha). Instead, it should always check the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) and [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) properties and handle the data accordingly.
     * 
     * As a convenience, this method performs color management from the frame's embedded color space (if it exists) to the sRGB color space. If there is no embedded color profile data, then no color management is performed. This method also attempts to read the EXIF orientation flag on the frame, and if it exists, will perform the necessary transformation to correctly orient the pixel data.
     * 
     * In order to retrieve the correct bitmap pixel width and height, the application should read the [OrientedPixelWidth](bitmapdecoder_orientedpixelwidth.md) and [OrientedPixelHeight](bitmapdecoder_orientedpixelheight.md) properties, instead of the [PixelWidth](bitmapdecoder_pixelwidth.md) and [PixelHeight](bitmapdecoder_pixelheight.md) properties.
     * 
     * This method is equivalent to calling the [GetPixelDataAsync(BitmapPixelFormat, BitmapAlphaMode, BitmapTransform, ExifOrientationMode, ColorManagementMode)](bitmapdecoder_getpixeldataasync_580908657.md) method with the following arguments:
     * 
     * | Argument | Value |
     * |---|---|
     * | *pixelFormat* | The value of the [BitmapPixelFormat](bitmapdecoder_bitmappixelformat.md) property. |
     * | *alphaMode* | The value of the [BitmapAlphaMode](bitmapdecoder_bitmapalphamode.md) property |
     * | *transform* | A new [BitmapTransform](bitmaptransform.md). |
     * | *exifOrientationMode* | The [ExifOrientationMode](exiforientationmode.md) value **RespectExifOrientation**. |
     * | *colorManagementMode* | The [ColorManagementMode](colormanagementmode.md) value **ColorManageToSRgb**. |
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {BitmapTransform} transform_ 
     * @param {Integer} exifOrientationMode_ 
     * @param {Integer} colorManagementMode_ 
     * @returns {IAsyncOperation<PixelDataProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getpixeldataasync
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
     * Asynchronously gets a [SoftwareBitmap](softwarebitmap.md) representation of the decoded bitmap.
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getsoftwarebitmapasync
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
     * Asynchronously gets a [SoftwareBitmap](softwarebitmap.md) representation of the decoded bitmap.
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getsoftwarebitmapasync
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
     * Asynchronously gets a [SoftwareBitmap](softwarebitmap.md) representation of the decoded bitmap.
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {BitmapTransform} transform_ 
     * @param {Integer} exifOrientationMode_ 
     * @param {Integer} colorManagementMode_ 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapdecoder.getsoftwarebitmapasync
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
