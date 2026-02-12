#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialFeedChildItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the child item of a [SocialFeedItem](socialfeeditem.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialFeedChildItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialFeedChildItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialFeedChildItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the author of the child item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem.author
     * @type {SocialUserInfo} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * Gets the primary [SocialFeedContent](socialfeedcontent.md) object associated with the child item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem.primarycontent
     * @type {SocialFeedContent} 
     */
    PrimaryContent {
        get => this.get_PrimaryContent()
    }

    /**
     * Gets the secondary [SocialFeedContent](socialfeedcontent.md) object associated with the child item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem.secondarycontent
     * @type {SocialFeedContent} 
     */
    SecondaryContent {
        get => this.get_SecondaryContent()
    }

    /**
     * Gets or sets the timestamp for the child item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
        set => this.put_Timestamp(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) to the target item associated with this child item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem.targeturi
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

    /**
     * Gets a list of thumbnail images associated with the child item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem.thumbnails
     * @type {IVector<SocialItemThumbnail>} 
     */
    Thumbnails {
        get => this.get_Thumbnails()
    }

    /**
     * Gets a social media item that was shared with the user by another user of the service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeedchilditem.shareditem
     * @type {SocialFeedSharedItem} 
     */
    SharedItem {
        get => this.get_SharedItem()
        set => this.put_SharedItem(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SocialFeedChildItem](socialfeedchilditem.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.SocialFeedChildItem")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {SocialUserInfo} 
     */
    get_Author() {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.get_Author()
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_PrimaryContent() {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.get_PrimaryContent()
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_SecondaryContent() {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.get_SecondaryContent()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.get_Timestamp()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_Timestamp(value) {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.put_Timestamp(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.get_TargetUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.put_TargetUri(value)
    }

    /**
     * 
     * @returns {IVector<SocialItemThumbnail>} 
     */
    get_Thumbnails() {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.get_Thumbnails()
    }

    /**
     * 
     * @returns {SocialFeedSharedItem} 
     */
    get_SharedItem() {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.get_SharedItem()
    }

    /**
     * 
     * @param {SocialFeedSharedItem} value 
     * @returns {HRESULT} 
     */
    put_SharedItem(value) {
        if (!this.HasProp("__ISocialFeedChildItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedChildItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedChildItem := ISocialFeedChildItem(outPtr)
        }

        return this.__ISocialFeedChildItem.put_SharedItem(value)
    }

;@endregion Instance Methods
}
