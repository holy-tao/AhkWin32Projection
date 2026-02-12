#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStartScreenManager.ahk
#Include .\IStartScreenManager2.ahk
#Include .\IStartScreenManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Start screen manager object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class StartScreenManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStartScreenManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStartScreenManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the current Start screen manager.
     * @returns {StartScreenManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.getdefault
     */
    static GetDefault() {
        if (!StartScreenManager.HasProp("__IStartScreenManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.StartScreenManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStartScreenManagerStatics.IID)
            StartScreenManager.__IStartScreenManagerStatics := IStartScreenManagerStatics(factoryPtr)
        }

        return StartScreenManager.__IStartScreenManagerStatics.GetDefault()
    }

    /**
     * Gets the Start screen manager for a specific user.
     * @param {User} user_ 
     * @returns {StartScreenManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.getforuser
     */
    static GetForUser(user_) {
        if (!StartScreenManager.HasProp("__IStartScreenManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.StartScreenManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStartScreenManagerStatics.IID)
            StartScreenManager.__IStartScreenManagerStatics := IStartScreenManagerStatics(factoryPtr)
        }

        return StartScreenManager.__IStartScreenManagerStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the user associated with the current Start screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IStartScreenManager")) {
            if ((queryResult := this.QueryInterface(IStartScreenManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartScreenManager := IStartScreenManager(outPtr)
        }

        return this.__IStartScreenManager.get_User()
    }

    /**
     * Checks if the app can be pinned to the current Start screen.
     * @param {AppListEntry} appListEntry_ 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.supportsapplistentry
     */
    SupportsAppListEntry(appListEntry_) {
        if (!this.HasProp("__IStartScreenManager")) {
            if ((queryResult := this.QueryInterface(IStartScreenManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartScreenManager := IStartScreenManager(outPtr)
        }

        return this.__IStartScreenManager.SupportsAppListEntry(appListEntry_)
    }

    /**
     * Checks if the app is currently pinned to the Start screen.
     * @param {AppListEntry} appListEntry_ 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.containsapplistentryasync
     */
    ContainsAppListEntryAsync(appListEntry_) {
        if (!this.HasProp("__IStartScreenManager")) {
            if ((queryResult := this.QueryInterface(IStartScreenManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartScreenManager := IStartScreenManager(outPtr)
        }

        return this.__IStartScreenManager.ContainsAppListEntryAsync(appListEntry_)
    }

    /**
     * Requests to pin the app to the current Start screen. Depending on the device family, this must be called on the UI thread, and will display a dialog asking the user to confirm they would like to pin the app.
     * @param {AppListEntry} appListEntry_ 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.requestaddapplistentryasync
     */
    RequestAddAppListEntryAsync(appListEntry_) {
        if (!this.HasProp("__IStartScreenManager")) {
            if ((queryResult := this.QueryInterface(IStartScreenManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartScreenManager := IStartScreenManager(outPtr)
        }

        return this.__IStartScreenManager.RequestAddAppListEntryAsync(appListEntry_)
    }

    /**
     * Checks if the specified secondary tile is pinned to Start.
     * @remarks
     * This API is only relevant when you are pinning your tiles to multiple surfaces, like pinning secondary tiles to taskbar. If you only pin secondary tiles to Start, you should instead use [SecondaryTile.Exists](secondarytile_exists_1536819090.md) which has been present since the first version of Windows 10.
     * @param {HSTRING} tileId The [TileId](secondarytile_tileid.md) of the [SecondaryTile](secondarytile.md) that you want to check is pinned.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.containssecondarytileasync
     */
    ContainsSecondaryTileAsync(tileId) {
        if (!this.HasProp("__IStartScreenManager2")) {
            if ((queryResult := this.QueryInterface(IStartScreenManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartScreenManager2 := IStartScreenManager2(outPtr)
        }

        return this.__IStartScreenManager2.ContainsSecondaryTileAsync(tileId)
    }

    /**
     * Tries to remove the specified secondary tile from Start.
     * @remarks
     * This API is only relevant when you are pinning your tiles to multiple surfaces, like pinning secondary tiles to taskbar. If you only pin secondary tiles to Start, you should instead use [SecondaryTile.RequestDeleteAsync](secondarytile_requestdeleteasync_880835933.md) which has been present since the first version of Windows 10.
     * @param {HSTRING} tileId The [TileId](secondarytile_tileid.md) of the [SecondaryTile](secondarytile.md) you want to remove.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.startscreenmanager.tryremovesecondarytileasync
     */
    TryRemoveSecondaryTileAsync(tileId) {
        if (!this.HasProp("__IStartScreenManager2")) {
            if ((queryResult := this.QueryInterface(IStartScreenManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartScreenManager2 := IStartScreenManager2(outPtr)
        }

        return this.__IStartScreenManager2.TryRemoveSecondaryTileAsync(tileId)
    }

;@endregion Instance Methods
}
