#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapEncoder.ahk
#Include .\IBitmapEncoderWithSoftwareBitmap.ahk
#Include .\IBitmapEncoderStatics2.ahk
#Include .\IBitmapEncoderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains methods to create, edit and save images.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapEncoder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapEncoder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapEncoder.IID

    /**
     * The unique identifier of the built-in HEIF encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.heifencoderid
     * @type {Guid} 
     */
    static HeifEncoderId {
        get => BitmapEncoder.get_HeifEncoderId()
    }

    /**
     * The unique identifier of the built-in BMP encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.bmpencoderid
     * @type {Guid} 
     */
    static BmpEncoderId {
        get => BitmapEncoder.get_BmpEncoderId()
    }

    /**
     * The unique identifier of the built-in JPEG encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.jpegencoderid
     * @type {Guid} 
     */
    static JpegEncoderId {
        get => BitmapEncoder.get_JpegEncoderId()
    }

    /**
     * The unique identifier of the built-in PNG encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.pngencoderid
     * @type {Guid} 
     */
    static PngEncoderId {
        get => BitmapEncoder.get_PngEncoderId()
    }

    /**
     * The unique identifier of the built-in TIFF encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.tiffencoderid
     * @type {Guid} 
     */
    static TiffEncoderId {
        get => BitmapEncoder.get_TiffEncoderId()
    }

    /**
     * The unique identifier of the built-in GIF encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.gifencoderid
     * @type {Guid} 
     */
    static GifEncoderId {
        get => BitmapEncoder.get_GifEncoderId()
    }

    /**
     * The unique identifier of the built-in JPEG-XR encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.jpegxrencoderid
     * @type {Guid} 
     */
    static JpegXREncoderId {
        get => BitmapEncoder.get_JpegXREncoderId()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Guid} 
     */
    static get_HeifEncoderId() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics2.IID)
            BitmapEncoder.__IBitmapEncoderStatics2 := IBitmapEncoderStatics2(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics2.get_HeifEncoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BmpEncoderId() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.get_BmpEncoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_JpegEncoderId() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.get_JpegEncoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_PngEncoderId() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.get_PngEncoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TiffEncoderId() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.get_TiffEncoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GifEncoderId() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.get_GifEncoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_JpegXREncoderId() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.get_JpegXREncoderId()
    }

    /**
     * A list of the bitmap encoders installed on the system and information about them.
     * @returns {IVectorView<BitmapCodecInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.getencoderinformationenumerator
     */
    static GetEncoderInformationEnumerator() {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.GetEncoderInformationEnumerator()
    }

    /**
     * Asynchronously creates a new [BitmapEncoder](bitmapencoder.md) for the specified codec with the specified encoding options and initializes it on a stream.
     * @param {Guid} encoderId The unique identifier of the specified encoder.
     * @param {IRandomAccessStream} stream A stream representing where the image file is to be written.
     * @returns {IAsyncOperation<BitmapEncoder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.createasync
     */
    static CreateAsync(encoderId, stream) {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.CreateAsync(encoderId, stream)
    }

    /**
     * Asynchronously creates a new [BitmapEncoder](bitmapencoder.md).
     * @remarks
     * An application must always specify the *encoderId* in order to create a [BitmapEncoder](bitmapencoder.md). The unique identifiers of the built-in encoders are available as properties on [BitmapEncoder](bitmapencoder.md). In addition, the unique identifier of any installed encoder can be obtained by using the [GetEncoderInformationEnumerator](bitmapencoder_getencoderinformationenumerator_1011982973.md) method.
     * 
     * [BitmapEncoder](bitmapencoder.md) expects that the output stream is empty. You can ensure that the stream is empty by setting its [Size](../windows.storage.streams/irandomaccessstream_size.md) property to 0.
     * @param {Guid} encoderId The unique identifier of the specified encoder.
     * @param {IRandomAccessStream} stream The output stream.
     * @param {IIterable<IKeyValuePair<HSTRING, BitmapTypedValue>>} encodingOptions 
     * @returns {IAsyncOperation<BitmapEncoder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.createasync
     */
    static CreateWithEncodingOptionsAsync(encoderId, stream, encodingOptions) {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.CreateWithEncodingOptionsAsync(encoderId, stream, encodingOptions)
    }

    /**
     * Asynchronously creates a new [BitmapEncoder](bitmapencoder.md) and initializes it using data from an existing [BitmapDecoder](bitmapdecoder.md).
     * @remarks
     * Call this method when you want to edit some elements in an image but want to preserve the rest of the data intact. For example, if you want to write some metadata or properties but don't want to touch the image itself. When you create a [BitmapEncoder](bitmapencoder.md) using this method, it is initialized using data from the *bitmapDecoder* argument. Any data that you set on the encoder will overwrite the existing data, and all other data is preserved unchanged.
     * 
     * This method only allows you to create an encoder of the same image format as the decoder.
     * @param {IRandomAccessStream} stream The output stream.
     * @param {BitmapDecoder} bitmapDecoder_ A [BitmapDecoder](bitmapdecoder.md) containing the image data to be copied.
     * @returns {IAsyncOperation<BitmapEncoder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.createfortranscodingasync
     */
    static CreateForTranscodingAsync(stream, bitmapDecoder_) {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.CreateForTranscodingAsync(stream, bitmapDecoder_)
    }

    /**
     * Asynchronously creates a new [BitmapEncoder](bitmapencoder.md) for in-place property and metadata editing. The new encoder can only edit bitmap properties in-place and will fail for any other uses.
     * @remarks
     * Use this method to retrieve an encoder when you are only going to use it to edit or write a limited amount of properties to the image. An encoder retrieved this way can provide a performance advantage over an encoder returned by [CreateForTranscodingAsync](bitmapencoder_createfortranscodingasync_1673967352.md) because it writes the new properties to empty padding space instead of encoding the entire image again.
     * 
     * Here are several limitations to an encoder retrieved this way:
     * 
     * 
     * + You can only use these methods on the encoder:
     *    + [BitmapEncoder.BitmapProperties.GetPropertiesAsync](bitmapproperties_getpropertiesasync_1829853186.md)
     *    + [BitmapEncoder.BitmapProperties.SetPropertiesAsync](bitmapproperties_setpropertiesasync_1991487715.md)
     *    + [BitmapEncoder.FlushAsync](bitmapencoder_flushasync_491532439.md)
     *  Any other methods will fail if you call them.
     * + The input [BitmapDecoder](bitmapdecoder.md) must be an encoder created on a stream with [ReadWrite](../windows.storage/fileaccessmode.md) access.
     * + Not all metadata formats support fast metadata encoding. The native metadata handlers that support metadata are IFD, Exif, XMP, and GPS.
     * + The metadata block must have enough padding to store the properties that you are trying to edit.
     * If an encoding operation fails for any reason, you will have to use [CreateForTranscodingAsync](bitmapencoder_createfortranscodingasync_1673967352.md) to edit the metadata and re-encode the image. When you re-encode, you can also add new or additional padding to enable in-place property encoding in the future. To do this, create a new [BitmapTypedValue](bitmaptypedvalue.md) with Type set to UInt32 and Value set to the number of bytes of padding you wish to add. A typical value is 4096 bytes. Set this metadata item on one or more of the metadata query locations in this table. <table>
     *    <tr><th>Metadata format</th><th>JPEG metadata query</th><th>TIFF, JPEG-XR metadata query</th></tr>
     *    <tr><td>IFD</td><td>/app1/ifd/PaddingSchema:Padding</td><td>/ifd/PaddingSchema:Padding</td></tr>
     *    <tr><td>EXIF</td><td>/app1/ifd/exif/PaddingSchema:Padding</td><td>/ifd/exif/PaddingSchema:Padding</td></tr>
     *    <tr><td>XMP</td><td>/xmp/PaddingSchema:Padding</td><td>/ifd/xmp/PaddingSchema:Padding</td></tr>
     *    <tr><td>GPS</td><td>/app1/ifd/gps/PaddingSchema:Padding</td><td>/ifd/gps/PaddingSchema:Padding</td></tr>
     * </table>
     * @param {BitmapDecoder} bitmapDecoder_ A [BitmapDecoder](bitmapdecoder.md) containing the image data to be edited. This parameter must be created on a stream with an access mode of [ReadWrite](../windows.storage/fileaccessmode.md).
     * 
     * > [!NOTE]
     * > The encoder writes to the stream that the original [BitmapDecoder](bitmapdecoder.md) was created on. You can't specify an output stream.
     * @returns {IAsyncOperation<BitmapEncoder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.createforinplacepropertyencodingasync
     */
    static CreateForInPlacePropertyEncodingAsync(bitmapDecoder_) {
        if (!BitmapEncoder.HasProp("__IBitmapEncoderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapEncoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapEncoderStatics.IID)
            BitmapEncoder.__IBitmapEncoderStatics := IBitmapEncoderStatics(factoryPtr)
        }

        return BitmapEncoder.__IBitmapEncoderStatics.CreateForInPlacePropertyEncodingAsync(bitmapDecoder_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Information about the bitmap encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.encoderinformation
     * @type {BitmapCodecInformation} 
     */
    EncoderInformation {
        get => this.get_EncoderInformation()
    }

    /**
     * The metadata for the selected frame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.bitmapproperties
     * @type {BitmapProperties} 
     */
    BitmapProperties {
        get => this.get_BitmapProperties()
    }

    /**
     * The metadata for the container.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.bitmapcontainerproperties
     * @type {BitmapProperties} 
     */
    BitmapContainerProperties {
        get => this.get_BitmapContainerProperties()
    }

    /**
     * Indicates whether or not a new thumbnail is automatically generated.
     * @remarks
     * When this value is true, the bitmap encoder will generate a new thumbnail by downscaling the frame bitmap. The thumbnail size is determined by the [GeneratedThumbnailWidth](bitmapencoder_generatedthumbnailwidth.md) and [GeneratedThumbnailHeight](bitmapencoder_generatedthumbnailheight.md) properties. When this value is false, no thumbnail is written to the file.
     * 
     * If the [BitmapEncoder](bitmapencoder.md) was created using the [CreateForTranscodingAsync](bitmapencoder_createfortranscodingasync_1673967352.md) method and **IsThumbnailGenerated** is false, the bitmap encoder will leave any existing thumbnail data untouched. In this case, if the bitmap was modified before encoding, it's possible for the output file to have a thumbnail that does not match the new contents of the image.
     * 
     * Only JPEG, TIFF and JPEG-XR image types support encoding thumbnails. If the image format being encoded does not support thumbnails and you set **IsThumbnailGenerated** to true, then the call to [FlushAsync](bitmapencoder_flushasync_491532439.md) will fail with HRESULT [WINCODEC_ERR_UNSUPPORTEDOPERATION](/windows/desktop/wic/-wic-codec-error-codes). You should catch this exception and retry encoding with thumbnail generation disabled. If your app only encodes image formats that support thumbnails, you can skip this step.
     * 
     * 
     * 
     * ```csharp
     * 
     *    try
     *     {
     *         await encoder.FlushAsync();
     *     }
     *     catch (Exception err)
     *     {
     *         switch (err.HResult)
     *         {
     *             case unchecked ((int) 0x88982F81): //WINCODEC_ERR_UNSUPPORTEDOPERATION
     *                 // If the encoder does not support writing a thumbnail, then try again
     *                 // but disable thumbnail generation.
     *                 encoder.IsThumbnailGenerated = false;
     *                 break;
     *             default:
     *                 throw err;
     *         }
     *     }
     * 
     *     if (encoder.IsThumbnailGenerated == false)
     *     {
     *         await encoder.FlushAsync();
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.isthumbnailgenerated
     * @type {Boolean} 
     */
    IsThumbnailGenerated {
        get => this.get_IsThumbnailGenerated()
        set => this.put_IsThumbnailGenerated(value)
    }

    /**
     * The width, in pixels, of any generated thumbnail.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.generatedthumbnailwidth
     * @type {Integer} 
     */
    GeneratedThumbnailWidth {
        get => this.get_GeneratedThumbnailWidth()
        set => this.put_GeneratedThumbnailWidth(value)
    }

    /**
     * The height, in pixels, of any generated thumbnail.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.generatedthumbnailheight
     * @type {Integer} 
     */
    GeneratedThumbnailHeight {
        get => this.get_GeneratedThumbnailHeight()
        set => this.put_GeneratedThumbnailHeight(value)
    }

    /**
     * A [BitmapTransform](bitmaptransform.md) object that is used to specify how the frame bitmap is to be transformed.
     * @remarks
     * If you try scale an image stored in an indexed pixel format using the [BitmapTransform](bitmaptransform.md) member, [FlushAsync](bitmapencoder_flushasync_491532439.md) fails with HRESULT [WINCODEC_ERR_INVALIDPARAMETER](/windows/desktop/wic/-wic-codec-error-codes) . Instead, you must use [GetPixelDataAsync](/uwp/api/windows.graphics.imaging.bitmapdecoder.getpixeldataasync) to obtain the scaled pixel data and then use [SetPixelData](bitmapencoder_setpixeldata_644328650.md) to set it on the encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.bitmaptransform
     * @type {BitmapTransform} 
     */
    BitmapTransform {
        get => this.get_BitmapTransform()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BitmapCodecInformation} 
     */
    get_EncoderInformation() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.get_EncoderInformation()
    }

    /**
     * 
     * @returns {BitmapProperties} 
     */
    get_BitmapProperties() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.get_BitmapProperties()
    }

    /**
     * 
     * @returns {BitmapProperties} 
     */
    get_BitmapContainerProperties() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.get_BitmapContainerProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsThumbnailGenerated() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.get_IsThumbnailGenerated()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsThumbnailGenerated(value) {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.put_IsThumbnailGenerated(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeneratedThumbnailWidth() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.get_GeneratedThumbnailWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GeneratedThumbnailWidth(value) {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.put_GeneratedThumbnailWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeneratedThumbnailHeight() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.get_GeneratedThumbnailHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GeneratedThumbnailHeight(value) {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.put_GeneratedThumbnailHeight(value)
    }

    /**
     * 
     * @returns {BitmapTransform} 
     */
    get_BitmapTransform() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.get_BitmapTransform()
    }

    /**
     * Sets pixel data on the frame.
     * @remarks
     * This method is synchronous because data is not committed until [FlushAsync](bitmapencoder_flushasync_491532439.md), [GoToNextFrameAsync](bitmapencoder_gotonextframeasync_718000702.md) or [GoToNextFrameAsync(IIterable(IKeyValuePair))](bitmapencoder_gotonextframeasync_1063265177.md) is called.
     * 
     * Setting a pixel format of **Unknown** will result in failure.
     * 
     * This method treats all pixel data as being in the sRGB color space. When you call this method it automatically clears any existing color space information from the frame, including embedded color profiles.
     * 
     * When you are encoding a new image, before you call [FlushAsync](bitmapencoder_flushasync_491532439.md) at the minimum you must set pixel data using this method.
     * @param {Integer} pixelFormat The pixel format of the pixel data.
     * @param {Integer} alphaMode The alpha mode of the pixel data.
     * @param {Integer} width The width, in pixels, of the pixel data.
     * @param {Integer} height The height, in pixels, of the pixel data.
     * @param {Float} dpiX The horizontal resolution, in dots per inch, of the pixel data.
     * @param {Float} dpiY The vertical resolution, in dots per inch, of the pixel data.
     * @param {Integer} pixels_length 
     * @param {Pointer<Integer>} pixels The pixel data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.setpixeldata
     */
    SetPixelData(pixelFormat, alphaMode, width, height, dpiX, dpiY, pixels_length, pixels) {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.SetPixelData(pixelFormat, alphaMode, width, height, dpiX, dpiY, pixels_length, pixels)
    }

    /**
     * Asynchronously commits the current frame data and appends a new empty frame, with the specified encoding options, to be edited.
     * @remarks
     * You can obtain a collection of key-value pairs that you can pass to the *encodingOptions* parameter by creating a new [BitmapPropertySet](bitmappropertyset.md).
     * 
     * See [CreateAsync(Guid, IRandomAccessStream, IIterable(IKeyValuePair))](bitmapencoder_createasync_415643468.md) for more information about using encoding options.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.gotonextframeasync
     */
    GoToNextFrameAsync() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.GoToNextFrameAsync()
    }

    /**
     * Asynchronously commits the current frame data and appends a new empty frame to be edited.
     * @remarks
     * After this method is called, data on the just-committed frame is no longer accessible. Instead, a new, empty frame is appended to the image and subsequent reads and writes on the [BitmapEncoder](bitmapencoder.md) will access this frame. You can't "rewind" to a previously committed frame.
     * 
     * Don't call this method if the current frame is intended to be the last frame in the image, as this will result in a superfluous, empty frame at the end of the image. Instead, call [FlushAsync](bitmapencoder_flushasync_491532439.md) which will commit the frame and close the entire [BitmapEncoder](bitmapencoder.md). For example, in most scenarios the application only needs to save a single-frame image. In these cases GoToNextFrameAsync should never be called.
     * 
     * The first time this method is called, all container level data as well as the first frame data is committed. Afterwards, any attempts to access container level data will fail.
     * @param {IIterable<IKeyValuePair<HSTRING, BitmapTypedValue>>} encodingOptions 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.gotonextframeasync
     */
    GoToNextFrameWithEncodingOptionsAsync(encodingOptions) {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.GoToNextFrameWithEncodingOptionsAsync(encodingOptions)
    }

    /**
     * Asynchronously commits and flushes all of the image data.
     * @remarks
     * Call this method when you are done encoding and before you close the output stream. The minimum data you need to set on a new image before calling FlushAsync is the pixel data ([SetPixelData](bitmapencoder_setpixeldata_644328650.md)). After this method is called, any subsequent calls to [BitmapEncoder](bitmapencoder.md) methods will fail.
     * 
     * If, after encoding is complete, you want to reuse the [IRandomAccessStream](/previous-versions/hh438400(v=vs.85)) from which the [BitmapEncoder](bitmapencoder.md) was created, such as passing it to the [Windows.Storage.Compression](../windows.storage.compression/windows_storage_compression.md) APIs, you must first reset the stream's seek position to 0, the start of the stream, by calling [IRandomAccessStream.Seek](../windows.storage.streams/irandomaccessstream_seek_1797934981.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.flushasync
     */
    FlushAsync() {
        if (!this.HasProp("__IBitmapEncoder")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoder := IBitmapEncoder(outPtr)
        }

        return this.__IBitmapEncoder.FlushAsync()
    }

    /**
     * Sets the image data of the current frame using the specified [SoftwareBitmap](softwarebitmap.md).
     * @remarks
     * [BitmapEncoder](bitmapencoder.md) only supports software bitmaps that have a [BitmapPixelFormat](bitmappixelformat.md) of **Rgba16**, **Rgba8**, or **Bgra8**. Attempting to call **SetSoftwareBitmap** with a software bitmap that has a different pixel format results in a format unsupported error. Use the [SoftwareBitmap.Convert](/uwp/api/windows.graphics.imaging.softwarebitmap.convert) method to create a copy of an existing software bitmap with a different pixel format.
     * @param {SoftwareBitmap} bitmap_ The software bitmap containing the image data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapencoder.setsoftwarebitmap
     */
    SetSoftwareBitmap(bitmap_) {
        if (!this.HasProp("__IBitmapEncoderWithSoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(IBitmapEncoderWithSoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapEncoderWithSoftwareBitmap := IBitmapEncoderWithSoftwareBitmap(outPtr)
        }

        return this.__IBitmapEncoderWithSoftwareBitmap.SetSoftwareBitmap(bitmap_)
    }

;@endregion Instance Methods
}
