#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapCodecInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to information about a decoder or encoder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapcodecinformation
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapCodecInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapCodecInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapCodecInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The unique identifier of the decoder or encoder. Methods like [BitmapDecoder.CreateAsync](/uwp/api/windows.graphics.imaging.bitmapdecoder.createasync) and [BitmapEncoder.CreateAsync](/uwp/api/windows.graphics.imaging.bitmapencoder.createasync) use the codec identifier to determine which codec to create.
     * @remarks
     * The encoder and decoder of an image format are separate, and their codec IDs are distinct.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapcodecinformation.codecid
     * @type {Guid} 
     */
    CodecId {
        get => this.get_CodecId()
    }

    /**
     * A collection of all the file extensions supported by the decoder or encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapcodecinformation.fileextensions
     * @type {IVectorView<HSTRING>} 
     */
    FileExtensions {
        get => this.get_FileExtensions()
    }

    /**
     * The friendly name of the decoder or encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapcodecinformation.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * A collection of all the MIME/content types supported by the decoder or encoder. MIME type is synonymous with [content type](../windows.storage.streams/icontenttypeprovider_contenttype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapcodecinformation.mimetypes
     * @type {IVectorView<HSTRING>} 
     */
    MimeTypes {
        get => this.get_MimeTypes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CodecId() {
        if (!this.HasProp("__IBitmapCodecInformation")) {
            if ((queryResult := this.QueryInterface(IBitmapCodecInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapCodecInformation := IBitmapCodecInformation(outPtr)
        }

        return this.__IBitmapCodecInformation.get_CodecId()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_FileExtensions() {
        if (!this.HasProp("__IBitmapCodecInformation")) {
            if ((queryResult := this.QueryInterface(IBitmapCodecInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapCodecInformation := IBitmapCodecInformation(outPtr)
        }

        return this.__IBitmapCodecInformation.get_FileExtensions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__IBitmapCodecInformation")) {
            if ((queryResult := this.QueryInterface(IBitmapCodecInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapCodecInformation := IBitmapCodecInformation(outPtr)
        }

        return this.__IBitmapCodecInformation.get_FriendlyName()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_MimeTypes() {
        if (!this.HasProp("__IBitmapCodecInformation")) {
            if ((queryResult := this.QueryInterface(IBitmapCodecInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapCodecInformation := IBitmapCodecInformation(outPtr)
        }

        return this.__IBitmapCodecInformation.get_MimeTypes()
    }

;@endregion Instance Methods
}
