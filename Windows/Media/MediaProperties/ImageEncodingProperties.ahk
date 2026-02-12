#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageEncodingProperties.ahk
#Include .\IMediaEncodingProperties.ahk
#Include .\IImageEncodingProperties2.ahk
#Include .\IImageEncodingPropertiesStatics.ahk
#Include .\IImageEncodingPropertiesStatics3.ahk
#Include .\IImageEncodingPropertiesStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the format of an image stream.
 * @remarks
 * For how-to guidance for using **ImageEncodingProperties** to set the encoding properties for captured images, see [Basic photo, video, and audio capture with MediaCapture](/windows/uwp/audio-video-camera/basic-photo-video-and-audio-capture-with-mediacapture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class ImageEncodingProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageEncodingProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageEncodingProperties.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [ImageEncodingProperties](imageencodingproperties.md) for a JPEG image.
     * @returns {ImageEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.createjpeg
     */
    static CreateJpeg() {
        if (!ImageEncodingProperties.HasProp("__IImageEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ImageEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageEncodingPropertiesStatics.IID)
            ImageEncodingProperties.__IImageEncodingPropertiesStatics := IImageEncodingPropertiesStatics(factoryPtr)
        }

        return ImageEncodingProperties.__IImageEncodingPropertiesStatics.CreateJpeg()
    }

    /**
     * Creates an instance of [ImageEncodingProperties](imageencodingproperties.md) for a PNG image.
     * @returns {ImageEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.createpng
     */
    static CreatePng() {
        if (!ImageEncodingProperties.HasProp("__IImageEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ImageEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageEncodingPropertiesStatics.IID)
            ImageEncodingProperties.__IImageEncodingPropertiesStatics := IImageEncodingPropertiesStatics(factoryPtr)
        }

        return ImageEncodingProperties.__IImageEncodingPropertiesStatics.CreatePng()
    }

    /**
     * Creates an instance of [ImageEncodingProperties](imageencodingproperties.md) for a JPEG XR image.
     * @returns {ImageEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.createjpegxr
     */
    static CreateJpegXR() {
        if (!ImageEncodingProperties.HasProp("__IImageEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ImageEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageEncodingPropertiesStatics.IID)
            ImageEncodingProperties.__IImageEncodingPropertiesStatics := IImageEncodingPropertiesStatics(factoryPtr)
        }

        return ImageEncodingProperties.__IImageEncodingPropertiesStatics.CreateJpegXR()
    }

    /**
     * Creates an instance of [ImageEncodingProperties](imageencodingproperties.md) for HEIF format.
     * @returns {ImageEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.createheif
     */
    static CreateHeif() {
        if (!ImageEncodingProperties.HasProp("__IImageEncodingPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ImageEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageEncodingPropertiesStatics3.IID)
            ImageEncodingProperties.__IImageEncodingPropertiesStatics3 := IImageEncodingPropertiesStatics3(factoryPtr)
        }

        return ImageEncodingProperties.__IImageEncodingPropertiesStatics3.CreateHeif()
    }

    /**
     * Creates an instance of [ImageEncodingProperties](imageencodingproperties.md) for an uncompressed image.
     * @param {Integer} format The media pixel format.
     * @returns {ImageEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.createuncompressed
     */
    static CreateUncompressed(format) {
        if (!ImageEncodingProperties.HasProp("__IImageEncodingPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ImageEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageEncodingPropertiesStatics2.IID)
            ImageEncodingProperties.__IImageEncodingPropertiesStatics2 := IImageEncodingPropertiesStatics2(factoryPtr)
        }

        return ImageEncodingProperties.__IImageEncodingPropertiesStatics2.CreateUncompressed(format)
    }

    /**
     * Creates an instance of [ImageEncodingProperties](imageencodingproperties.md) for a BMP image.
     * @returns {ImageEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.createbmp
     */
    static CreateBmp() {
        if (!ImageEncodingProperties.HasProp("__IImageEncodingPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ImageEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageEncodingPropertiesStatics2.IID)
            ImageEncodingProperties.__IImageEncodingPropertiesStatics2 := IImageEncodingPropertiesStatics2(factoryPtr)
        }

        return ImageEncodingProperties.__IImageEncodingPropertiesStatics2.CreateBmp()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the image width.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * Gets or sets the image height.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * Gets additional format properties for the image stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.properties
     * @type {MediaPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the format type.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the subtype of the format.
     * @remarks
     * The value can be the string representation of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in canonical form, or one of the predefined values listed in the following table.<table>
     *    <tr><th>Value</th><th>Description</th></tr>
     *    <tr><td>"BMP"</td><td>Bitmap image.</td></tr>
     *    <tr><td>"ICO"</td><td>ICO image.</td></tr>
     *    <tr><td>"GIF"</td><td>GIF image.</td></tr>
     *    <tr><td>"JPEG"</td><td>JPEG image.</td></tr>
     *    <tr><td>"PNG"</td><td>PNG image.</td></tr>
     *    <tr><td>"TIFF"</td><td>TIFF image.</td></tr>
     *    <tr><td>"WMP"</td><td>JPEG-XR or HD Photo image.</td></tr>
     * </table>
     * 
     * > [!WARNING]
     * > The string values returned by the [MediaEncodingSubtypes](mediaencodingsubtypes.md) properties may not use the same letter casing as [AudioEncodingProperties.Subtype](audioencodingproperties_subtype.md), [VideoEncodingProperties.Subtype](videoencodingproperties_subtype.md), [ContainerEncodingProperties.Subtype](containerencodingproperties_subtype.md), and ImageEncodingProperties.Subtype. For this reason, if you compare the values, you should use a case-insensitive comparison or use hardcoded strings that match the casing returned by the encoding properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
        set => this.put_Subtype(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [ImageEncodingProperties](imageencodingproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ImageEncodingProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Width(value) {
        if (!this.HasProp("__IImageEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IImageEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageEncodingProperties := IImageEncodingProperties(outPtr)
        }

        return this.__IImageEncodingProperties.put_Width(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IImageEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IImageEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageEncodingProperties := IImageEncodingProperties(outPtr)
        }

        return this.__IImageEncodingProperties.get_Width()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Height(value) {
        if (!this.HasProp("__IImageEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IImageEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageEncodingProperties := IImageEncodingProperties(outPtr)
        }

        return this.__IImageEncodingProperties.put_Height(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IImageEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IImageEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageEncodingProperties := IImageEncodingProperties(outPtr)
        }

        return this.__IImageEncodingProperties.get_Height()
    }

    /**
     * 
     * @returns {MediaPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Type()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subtype(value) {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.put_Subtype(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtype() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Subtype()
    }

    /**
     * Creates a copy of the **ImageEncodingProperties** object.
     * @returns {ImageEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imageencodingproperties.copy
     */
    Copy() {
        if (!this.HasProp("__IImageEncodingProperties2")) {
            if ((queryResult := this.QueryInterface(IImageEncodingProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageEncodingProperties2 := IImageEncodingProperties2(outPtr)
        }

        return this.__IImageEncodingProperties2.Copy()
    }

;@endregion Instance Methods
}
