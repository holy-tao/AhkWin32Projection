#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayWireFormat.ahk
#Include .\IDisplayWireFormatFactory.ahk
#Include .\IDisplayWireFormatStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Specifies an exact hardware representation used to scan out; such as the pixel encoding, bits per channel, color space, and HDR metadata format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayWireFormat extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayWireFormat

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayWireFormat.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a [DisplayWireFormat](displaywireformat.md) object from the supplied property values.
     * @param {Integer} pixelEncoding Describes how pixels are encoded by the display pipeline, including chroma subsampling.
     * @param {Integer} bitsPerChannel The number of bits used for each channel, without regard for chroma subsampling.
     * @param {Integer} colorSpace Describes the color space.
     * @param {Integer} eotf Specifies the electro-optical transfer function (EOTF) that pixels are encoded for.
     * @param {Integer} hdrMetadata Specifies the format for static or dynamic HDR mastering metadata.
     * @returns {DisplayWireFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.#ctor
     */
    static CreateInstance(pixelEncoding, bitsPerChannel, colorSpace, eotf, hdrMetadata) {
        if (!DisplayWireFormat.HasProp("__IDisplayWireFormatFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayWireFormat")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayWireFormatFactory.IID)
            DisplayWireFormat.__IDisplayWireFormatFactory := IDisplayWireFormatFactory(factoryPtr)
        }

        return DisplayWireFormat.__IDisplayWireFormatFactory.CreateInstance(pixelEncoding, bitsPerChannel, colorSpace, eotf, hdrMetadata)
    }

    /**
     * Creates an instance of [DisplayWireFormat](displaywireformat.md) with the extra properties provided.
     * @param {IIterable<IKeyValuePair<Guid, IInspectable>>} extraProperties Reserved for future use.
     * @param {Integer} pixelEncoding 
     * @param {Integer} bitsPerChannel 
     * @param {Integer} colorSpace 
     * @param {Integer} eotf 
     * @param {Integer} hdrMetadata 
     * @returns {DisplayWireFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.createwithproperties
     */
    static CreateWithProperties(extraProperties, pixelEncoding, bitsPerChannel, colorSpace, eotf, hdrMetadata) {
        if (!DisplayWireFormat.HasProp("__IDisplayWireFormatStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayWireFormat")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayWireFormatStatics.IID)
            DisplayWireFormat.__IDisplayWireFormatStatics := IDisplayWireFormatStatics(factoryPtr)
        }

        return DisplayWireFormat.__IDisplayWireFormatStatics.CreateWithProperties(extraProperties, pixelEncoding, bitsPerChannel, colorSpace, eotf, hdrMetadata)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Describes how pixels are encoded by the display pipeline, including chroma subsampling.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.pixelencoding
     * @type {Integer} 
     */
    PixelEncoding {
        get => this.get_PixelEncoding()
    }

    /**
     * Gets the number of bits used for each channel, without regard for chroma subsampling.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.bitsperchannel
     * @type {Integer} 
     */
    BitsPerChannel {
        get => this.get_BitsPerChannel()
    }

    /**
     * Gets the color format.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.colorspace
     * @type {Integer} 
     */
    ColorSpace {
        get => this.get_ColorSpace()
    }

    /**
     * Specifies the electro-optical transfer function (EOTF) that pixels are encoded for.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.eotf
     * @type {Integer} 
     */
    Eotf {
        get => this.get_Eotf()
    }

    /**
     * Specifies the format for static or dynamic HDR mastering metadata.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.hdrmetadata
     * @type {Integer} 
     */
    HdrMetadata {
        get => this.get_HdrMetadata()
    }

    /**
     * Reserved for future use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformat.properties
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelEncoding() {
        if (!this.HasProp("__IDisplayWireFormat")) {
            if ((queryResult := this.QueryInterface(IDisplayWireFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayWireFormat := IDisplayWireFormat(outPtr)
        }

        return this.__IDisplayWireFormat.get_PixelEncoding()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerChannel() {
        if (!this.HasProp("__IDisplayWireFormat")) {
            if ((queryResult := this.QueryInterface(IDisplayWireFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayWireFormat := IDisplayWireFormat(outPtr)
        }

        return this.__IDisplayWireFormat.get_BitsPerChannel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpace() {
        if (!this.HasProp("__IDisplayWireFormat")) {
            if ((queryResult := this.QueryInterface(IDisplayWireFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayWireFormat := IDisplayWireFormat(outPtr)
        }

        return this.__IDisplayWireFormat.get_ColorSpace()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Eotf() {
        if (!this.HasProp("__IDisplayWireFormat")) {
            if ((queryResult := this.QueryInterface(IDisplayWireFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayWireFormat := IDisplayWireFormat(outPtr)
        }

        return this.__IDisplayWireFormat.get_Eotf()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HdrMetadata() {
        if (!this.HasProp("__IDisplayWireFormat")) {
            if ((queryResult := this.QueryInterface(IDisplayWireFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayWireFormat := IDisplayWireFormat(outPtr)
        }

        return this.__IDisplayWireFormat.get_HdrMetadata()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayWireFormat")) {
            if ((queryResult := this.QueryInterface(IDisplayWireFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayWireFormat := IDisplayWireFormat(outPtr)
        }

        return this.__IDisplayWireFormat.get_Properties()
    }

;@endregion Instance Methods
}
