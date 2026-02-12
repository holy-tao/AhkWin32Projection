#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialItemThumbnail.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a thumbnail image associated with a social media feed item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialitemthumbnail
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialItemThumbnail extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialItemThumbnail

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialItemThumbnail.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) to the target item associated with this thumbnail.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialitemthumbnail.targeturi
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) to the image file for this thumbnail.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialitemthumbnail.imageuri
     * @type {Uri} 
     */
    ImageUri {
        get => this.get_ImageUri()
        set => this.put_ImageUri(value)
    }

    /**
     * Gets or sets the size of the thumbnail bitmap image.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialitemthumbnail.bitmapsize
     * @type {BitmapSize} 
     */
    BitmapSize {
        get => this.get_BitmapSize()
        set => this.put_BitmapSize(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SocialItemThumbnail](socialitemthumbnail.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.SocialItemThumbnail")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        if (!this.HasProp("__ISocialItemThumbnail")) {
            if ((queryResult := this.QueryInterface(ISocialItemThumbnail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialItemThumbnail := ISocialItemThumbnail(outPtr)
        }

        return this.__ISocialItemThumbnail.get_TargetUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        if (!this.HasProp("__ISocialItemThumbnail")) {
            if ((queryResult := this.QueryInterface(ISocialItemThumbnail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialItemThumbnail := ISocialItemThumbnail(outPtr)
        }

        return this.__ISocialItemThumbnail.put_TargetUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ImageUri() {
        if (!this.HasProp("__ISocialItemThumbnail")) {
            if ((queryResult := this.QueryInterface(ISocialItemThumbnail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialItemThumbnail := ISocialItemThumbnail(outPtr)
        }

        return this.__ISocialItemThumbnail.get_ImageUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ImageUri(value) {
        if (!this.HasProp("__ISocialItemThumbnail")) {
            if ((queryResult := this.QueryInterface(ISocialItemThumbnail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialItemThumbnail := ISocialItemThumbnail(outPtr)
        }

        return this.__ISocialItemThumbnail.put_ImageUri(value)
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_BitmapSize() {
        if (!this.HasProp("__ISocialItemThumbnail")) {
            if ((queryResult := this.QueryInterface(ISocialItemThumbnail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialItemThumbnail := ISocialItemThumbnail(outPtr)
        }

        return this.__ISocialItemThumbnail.get_BitmapSize()
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_BitmapSize(value) {
        if (!this.HasProp("__ISocialItemThumbnail")) {
            if ((queryResult := this.QueryInterface(ISocialItemThumbnail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialItemThumbnail := ISocialItemThumbnail(outPtr)
        }

        return this.__ISocialItemThumbnail.put_BitmapSize(value)
    }

    /**
     * Asynchronously sets the image for this thumbnail from a local stream.
     * @param {IInputStream} image_ The image stream.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialitemthumbnail.setimageasync
     */
    SetImageAsync(image_) {
        if (!this.HasProp("__ISocialItemThumbnail")) {
            if ((queryResult := this.QueryInterface(ISocialItemThumbnail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialItemThumbnail := ISocialItemThumbnail(outPtr)
        }

        return this.__ISocialItemThumbnail.SetImageAsync(image_)
    }

;@endregion Instance Methods
}
