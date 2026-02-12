#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialDashboardItemUpdater.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a task that can update dashboard items.
 * @remarks
 * Call [SocialInfoProviderManager.CreateDashboardItemUpdaterAsync](socialinfoprovidermanager_createdashboarditemupdaterasync_1728882678.md) to create an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialdashboarditemupdater
 * @namespace Windows.ApplicationModel.SocialInfo.Provider
 * @version WindowsRuntime 1.4
 */
class SocialDashboardItemUpdater extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialDashboardItemUpdater

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialDashboardItemUpdater.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID that identifies the user on the provider's system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialdashboarditemupdater.ownerremoteid
     * @type {HSTRING} 
     */
    OwnerRemoteId {
        get => this.get_OwnerRemoteId()
    }

    /**
     * Gets a [SocialFeedContent](../windows.applicationmodel.socialinfo/socialfeedcontent.md) object which can be updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialdashboarditemupdater.content
     * @type {SocialFeedContent} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets or sets the timestamp for the update.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialdashboarditemupdater.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
        set => this.put_Timestamp(value)
    }

    /**
     * Gets or sets the thumbnail image for the dashboard item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialdashboarditemupdater.thumbnail
     * @type {SocialItemThumbnail} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Gets or sets the uniform resource identifier (URI) that is navigated to when the user taps the item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialdashboarditemupdater.targeturi
     * @type {Uri} 
     */
    TargetUri {
        get => this.get_TargetUri()
        set => this.put_TargetUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OwnerRemoteId() {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.get_OwnerRemoteId()
    }

    /**
     * 
     * @returns {SocialFeedContent} 
     */
    get_Content() {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.get_Content()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.get_Timestamp()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_Timestamp(value) {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.put_Timestamp(value)
    }

    /**
     * 
     * @param {SocialItemThumbnail} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {SocialItemThumbnail} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.get_Thumbnail()
    }

    /**
     * Asynchronously submits the update after all the properties have been set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialdashboarditemupdater.commitasync
     */
    CommitAsync() {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.CommitAsync()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_TargetUri() {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.get_TargetUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_TargetUri(value) {
        if (!this.HasProp("__ISocialDashboardItemUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialDashboardItemUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialDashboardItemUpdater := ISocialDashboardItemUpdater(outPtr)
        }

        return this.__ISocialDashboardItemUpdater.put_TargetUri(value)
    }

;@endregion Instance Methods
}
