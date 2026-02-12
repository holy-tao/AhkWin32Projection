#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialFeedUpdater.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a task the can be used to update a social media feed.
 * @remarks
 * Call [SocialInfoProviderManager.CreateSocialFeedUpdaterAsync](socialinfoprovidermanager_createsocialfeedupdaterasync_990295011.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialfeedupdater
 * @namespace Windows.ApplicationModel.SocialInfo.Provider
 * @version WindowsRuntime 1.4
 */
class SocialFeedUpdater extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocialFeedUpdater

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocialFeedUpdater.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID that identifies the user on the provider's system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialfeedupdater.ownerremoteid
     * @type {HSTRING} 
     */
    OwnerRemoteId {
        get => this.get_OwnerRemoteId()
    }

    /**
     * Gets the type of the social media feed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialfeedupdater.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the list of social media feed items.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialfeedupdater.items
     * @type {IVector<SocialFeedItem>} 
     */
    Items {
        get => this.get_Items()
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
        if (!this.HasProp("__ISocialFeedUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialFeedUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedUpdater := ISocialFeedUpdater(outPtr)
        }

        return this.__ISocialFeedUpdater.get_OwnerRemoteId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__ISocialFeedUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialFeedUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedUpdater := ISocialFeedUpdater(outPtr)
        }

        return this.__ISocialFeedUpdater.get_Kind()
    }

    /**
     * 
     * @returns {IVector<SocialFeedItem>} 
     */
    get_Items() {
        if (!this.HasProp("__ISocialFeedUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialFeedUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedUpdater := ISocialFeedUpdater(outPtr)
        }

        return this.__ISocialFeedUpdater.get_Items()
    }

    /**
     * Asynchronously submits the update after all the properties have been set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialfeedupdater.commitasync
     */
    CommitAsync() {
        if (!this.HasProp("__ISocialFeedUpdater")) {
            if ((queryResult := this.QueryInterface(ISocialFeedUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocialFeedUpdater := ISocialFeedUpdater(outPtr)
        }

        return this.__ISocialFeedUpdater.CommitAsync()
    }

;@endregion Instance Methods
}
