#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialFeedItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a social media feed item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem
 * @namespace Windows.ApplicationModel.SocialInfo
 * @version WindowsRuntime 1.4
 */
class SocialFeedItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialFeedItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialFeedItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the author of the social media feed item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.author
     * @type {SocialUserInfo} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * Gets the primary [SocialFeedContent](socialfeedcontent.md) object associated with the item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.primarycontent
     * @type {SocialFeedContent} 
     */
    PrimaryContent {
        get => this.get_PrimaryContent()
    }

    /**
     * Gets the secondary [SocialFeedContent](socialfeedcontent.md) object associated with this item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.secondarycontent
     * @type {SocialFeedContent} 
     */
    SecondaryContent {
        get => this.get_SecondaryContent()
    }

    /**
     * Gets or sets the timestamp for this item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
        set => this.put_Timestamp(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) to the target item associated with this item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.targeturi
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

    /**
     * Gets a list of thumbnail images associated with this item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.thumbnails
     * @type {IVector<SocialItemThumbnail>} 
     */
    Thumbnails {
        get => this.get_Thumbnails()
    }

    /**
     * Gets a social media item that was shared with the user by another user of the service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.shareditem
     * @type {SocialFeedSharedItem} 
     */
    SharedItem {
        get => this.get_SharedItem()
        set => this.put_SharedItem(value)
    }

    /**
     * Gets or sets the badge style for the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.badgestyle
     * @type {Integer} 
     */
    BadgeStyle {
        get => this.get_BadgeStyle()
        set => this.put_BadgeStyle(value)
    }

    /**
     * Gets or sets the number of unseen items displayed on the app badge.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.badgecountvalue
     * @type {Integer} 
     */
    BadgeCountValue {
        get => this.get_BadgeCountValue()
        set => this.put_BadgeCountValue(value)
    }

    /**
     * Gets or sets the value used to identify this item on the provider's system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets the child item associated with this social feed item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.childitem
     * @type {SocialFeedChildItem} 
     */
    ChildItem {
        get => this.get_ChildItem()
        set => this.put_ChildItem(value)
    }

    /**
     * Gets or set the style of this item, such as photo or default.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.socialfeeditem.style
     * @type {Integer} 
     */
    Style {
        get => this.get_Style()
        set => this.put_Style(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SocialFeedItem](socialfeeditem.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.SocialFeedItem")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {SocialUserInfo} 
     */
    get_Author() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_Author()
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_PrimaryContent() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_PrimaryContent()
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_SecondaryContent() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_SecondaryContent()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_Timestamp()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_Timestamp(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_Timestamp(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_TargetUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_TargetUri(value)
    }

    /**
     * 
     * @returns {IVector<SocialItemThumbnail>} 
     */
    get_Thumbnails() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_Thumbnails()
    }

    /**
     * 
     * @returns {SocialFeedSharedItem} 
     */
    get_SharedItem() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_SharedItem()
    }

    /**
     * 
     * @param {SocialFeedSharedItem} value 
     * @returns {HRESULT} 
     */
    put_SharedItem(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_SharedItem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BadgeStyle() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_BadgeStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BadgeStyle(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_BadgeStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BadgeCountValue() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_BadgeCountValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BadgeCountValue(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_BadgeCountValue(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_RemoteId(value)
    }

    /**
     * 
     * @returns {SocialFeedChildItem} 
     */
    get_ChildItem() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_ChildItem()
    }

    /**
     * 
     * @param {SocialFeedChildItem} value 
     * @returns {HRESULT} 
     */
    put_ChildItem(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_ChildItem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Style() {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.get_Style()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Style(value) {
        if (!this.HasProp("__ISocialFeedItem")) {
            if ((queryResult := this.QueryInterface(ISocialFeedItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedItem := ISocialFeedItem(outPtr)
        }

        return this.__ISocialFeedItem.put_Style(value)
    }

;@endregion Instance Methods
}
