#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreImage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an image that is associated with a product listing in the Windows Store.
 * @remarks
 * The [StoreProduct.Images](storeproduct_images.md), [StoreSku.Images](storesku_images.md), and [StoreVideo.PreviewImage](storevideo_previewimage.md) properties return objects of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeimage
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreImage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreImage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreImage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the URI of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeimage.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the tag for the image.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeimage.imagepurposetag
     * @type {HSTRING} 
     */
    ImagePurposeTag {
        get => this.get_ImagePurposeTag()
    }

    /**
     * Gets the width of the image, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeimage.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the image, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeimage.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the caption for the image.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeimage.caption
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IStoreImage")) {
            if ((queryResult := this.QueryInterface(IStoreImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreImage := IStoreImage(outPtr)
        }

        return this.__IStoreImage.get_Uri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ImagePurposeTag() {
        if (!this.HasProp("__IStoreImage")) {
            if ((queryResult := this.QueryInterface(IStoreImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreImage := IStoreImage(outPtr)
        }

        return this.__IStoreImage.get_ImagePurposeTag()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IStoreImage")) {
            if ((queryResult := this.QueryInterface(IStoreImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreImage := IStoreImage(outPtr)
        }

        return this.__IStoreImage.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IStoreImage")) {
            if ((queryResult := this.QueryInterface(IStoreImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreImage := IStoreImage(outPtr)
        }

        return this.__IStoreImage.get_Height()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        if (!this.HasProp("__IStoreImage")) {
            if ((queryResult := this.QueryInterface(IStoreImage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreImage := IStoreImage(outPtr)
        }

        return this.__IStoreImage.get_Caption()
    }

;@endregion Instance Methods
}
