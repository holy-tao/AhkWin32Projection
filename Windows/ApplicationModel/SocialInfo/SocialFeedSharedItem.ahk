#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialFeedSharedItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a social media item that was shared with the user by another user of the service.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedshareditem
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialFeedSharedItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialFeedSharedItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialFeedSharedItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the original Uniform Resource Identifier (URI) of the shared item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedshareditem.originalsource
     * @type {Uri} 
     */
    OriginalSource {
        get => this.get_OriginalSource()
        set => this.put_OriginalSource(value)
    }

    /**
     * Gets the [SocialFeedContent](socialfeedcontent.md) object associated with the shared item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedshareditem.content
     * @type {SocialFeedContent} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets or sets the timestamp for this shared item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedshareditem.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
        set => this.put_Timestamp(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) to the target item associated with this shared item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedshareditem.targeturi
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

    /**
     * Gets or sets a thumbnail image associated with this shared item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedshareditem.thumbnail
     * @type {SocialItemThumbnail} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SocialFeedSharedItem](socialfeedshareditem.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.SocialFeedSharedItem")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OriginalSource() {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.get_OriginalSource()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_OriginalSource(value) {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.put_OriginalSource(value)
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_Content() {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.get_Content()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.get_Timestamp()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_Timestamp(value) {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.put_Timestamp(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.get_TargetUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.put_TargetUri(value)
    }

    /**
     * 
     * @param {SocialItemThumbnail} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {SocialItemThumbnail} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__ISocialFeedSharedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedSharedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedSharedItem := ISocialFeedSharedItem(outPtr)
        }

        return this.__ISocialFeedSharedItem.get_Thumbnail()
    }

;@endregion Instance Methods
}
