#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreVideo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a video that is associated with a product listing in the Microsoft Store.
 * @remarks
 * The [StoreProduct.Videos](storeproduct_videos.md) and [StoreSku.Videos](storesku_videos.md) properties return objects of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storevideo
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreVideo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreVideo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreVideo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the URI of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storevideo.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the tag for the video.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storevideo.videopurposetag
     * @type {HSTRING} 
     */
    VideoPurposeTag {
        get => this.get_VideoPurposeTag()
    }

    /**
     * Gets the width of the video, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storevideo.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the video, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storevideo.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the caption for the video.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storevideo.caption
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
    }

    /**
     * Gets the preview image that is displayed for the video.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storevideo.previewimage
     * @type {StoreImage} 
     */
    PreviewImage {
        get => this.get_PreviewImage()
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
        if (!this.HasProp("__IStoreVideo")) {
            if ((queryResult := this.QueryInterface(IStoreVideo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreVideo := IStoreVideo(outPtr)
        }

        return this.__IStoreVideo.get_Uri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoPurposeTag() {
        if (!this.HasProp("__IStoreVideo")) {
            if ((queryResult := this.QueryInterface(IStoreVideo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreVideo := IStoreVideo(outPtr)
        }

        return this.__IStoreVideo.get_VideoPurposeTag()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IStoreVideo")) {
            if ((queryResult := this.QueryInterface(IStoreVideo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreVideo := IStoreVideo(outPtr)
        }

        return this.__IStoreVideo.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IStoreVideo")) {
            if ((queryResult := this.QueryInterface(IStoreVideo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreVideo := IStoreVideo(outPtr)
        }

        return this.__IStoreVideo.get_Height()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        if (!this.HasProp("__IStoreVideo")) {
            if ((queryResult := this.QueryInterface(IStoreVideo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreVideo := IStoreVideo(outPtr)
        }

        return this.__IStoreVideo.get_Caption()
    }

    /**
     * 
     * @returns {StoreImage} 
     */
    get_PreviewImage() {
        if (!this.HasProp("__IStoreVideo")) {
            if ((queryResult := this.QueryInterface(IStoreVideo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreVideo := IStoreVideo(outPtr)
        }

        return this.__IStoreVideo.get_PreviewImage()
    }

;@endregion Instance Methods
}
