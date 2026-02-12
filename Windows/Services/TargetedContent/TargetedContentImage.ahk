#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentImage.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the [TargetedContentValue](targetedcontentvalue.md) of the [TargetedContentValueKind](targetedcontentvaluekind.md) of type Image.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentimage
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentImage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentImage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentImage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the height of the TargetedContentImage object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentimage.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets a value indicating the width of the TargetedContentImage object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentimage.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
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
    get_Height() {
        if (!this.HasProp("__ITargetedContentImage")) {
            if ((queryResult := this.QueryInterface(ITargetedContentImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentImage := ITargetedContentImage(outPtr)
        }

        return this.__ITargetedContentImage.get_Height()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__ITargetedContentImage")) {
            if ((queryResult := this.QueryInterface(ITargetedContentImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentImage := ITargetedContentImage(outPtr)
        }

        return this.__ITargetedContentImage.get_Width()
    }

    /**
     * Opens a stream for read-only, random access.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentimage.openreadasync
     */
    OpenReadAsync() {
        if (!this.HasProp("__IRandomAccessStreamReference")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStreamReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStreamReference := IRandomAccessStreamReference(outPtr)
        }

        return this.__IRandomAccessStreamReference.OpenReadAsync()
    }

;@endregion Instance Methods
}
