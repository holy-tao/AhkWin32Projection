#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameListStatics2.ahk
#Include .\IGameListStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A list of games on the local system that provides properties for launching and managing how a game runs in Game Mode.
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelist
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class GameList extends IInspectable {
;@region Static Methods
    /**
     * Explicity merge two [GameListEntries](gamelistentry.md) to remove duplicates from the GameList.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {GameListEntry} left 
     * @param {GameListEntry} right 
     * @returns {IAsyncOperation<GameListEntry>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelist.mergeentriesasync
     */
    static MergeEntriesAsync(left, right) {
        if (!GameList.HasProp("__IGameListStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics2.IID)
            GameList.__IGameListStatics2 := IGameListStatics2(factoryPtr)
        }

        return GameList.__IGameListStatics2.MergeEntriesAsync(left, right)
    }

    /**
     * Unmerge a [GameListEntry](gamelistentry.md) if previously combined. The [GameListEntry’s](gamelistentry.md) may be remerged in the new enumeration call.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {GameListEntry} mergedEntry 
     * @returns {IAsyncOperation<IVectorView<GameListEntry>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelist.unmergeentryasync
     */
    static UnmergeEntryAsync(mergedEntry) {
        if (!GameList.HasProp("__IGameListStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics2.IID)
            GameList.__IGameListStatics2 := IGameListStatics2(factoryPtr)
        }

        return GameList.__IGameListStatics2.UnmergeEntryAsync(mergedEntry)
    }

    /**
     * Returns all [GameListEntries](gamelistentry.md) that match the provided packageFamilyName for the String parameter.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncOperation<IVectorView<GameListEntry>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelist.findallasync
     */
    static FindAllAsync() {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.FindAllAsync()
    }

    /**
     * Returns all [GameListEntries](gamelistentry.md).
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<IVectorView<GameListEntry>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelist.findallasync
     */
    static FindAllAsyncPackageFamilyName(packageFamilyName) {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.FindAllAsyncPackageFamilyName(packageFamilyName)
    }

    /**
     * 
     * @param {GameListChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_GameAdded(handler) {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.add_GameAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_GameAdded(token) {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.remove_GameAdded(token)
    }

    /**
     * 
     * @param {GameListRemovedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_GameRemoved(handler) {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.add_GameRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_GameRemoved(token) {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.remove_GameRemoved(token)
    }

    /**
     * 
     * @param {GameListChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_GameUpdated(handler) {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.add_GameUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_GameUpdated(token) {
        if (!GameList.HasProp("__IGameListStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameListStatics.IID)
            GameList.__IGameListStatics := IGameListStatics(factoryPtr)
        }

        return GameList.__IGameListStatics.remove_GameUpdated(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
