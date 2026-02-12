#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveContainerInfoQuery.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enumerates game save containers within a game save provider.
 * @remarks
 * Use [GameSaveProvider.CreateContainerInfoQuery](gamesaveprovider_createcontainerinfoquery_424994130.md) to create a **GameSaveContainerInfoQuery** instance.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfoquery
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveContainerInfoQuery extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveContainerInfoQuery

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveContainerInfoQuery.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously retrieves information for all game save containers that match this query. Containers are enumerated in order of the most recently modified first.
     * @remarks
     * After the asynchronous operation completes, check the [Status](gamesavecontainerinfogetresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @returns {IAsyncOperation<GameSaveContainerInfoGetResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfoquery.getcontainerinfoasync
     */
    GetContainerInfoAsync() {
        if (!this.HasProp("__IGameSaveContainerInfoQuery")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfoQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfoQuery := IGameSaveContainerInfoQuery(outPtr)
        }

        return this.__IGameSaveContainerInfoQuery.GetContainerInfoAsync()
    }

    /**
     * Asynchronously retrieves information for all game save containers that match this query. Containers are enumerated in order of the most recently modified first.
     * @remarks
     * After the asynchronous operation completes, check the [Status](gamesavecontainerinfogetresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<GameSaveContainerInfoGetResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfoquery.getcontainerinfoasync
     */
    GetContainerInfoWithIndexAndMaxAsync(startIndex, maxNumberOfItems) {
        if (!this.HasProp("__IGameSaveContainerInfoQuery")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfoQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfoQuery := IGameSaveContainerInfoQuery(outPtr)
        }

        return this.__IGameSaveContainerInfoQuery.GetContainerInfoWithIndexAndMaxAsync(startIndex, maxNumberOfItems)
    }

    /**
     * Retrieves the number of containers that match the query that created this [GameSaveContainerInfoQuery](gamesavecontainerinfoquery.md) object.
     * @remarks
     * After the asynchronous operation completes, the operation result of the returned **IAsyncOperation** object contains the number of blobs that match this query.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfoquery.getitemcountasync
     */
    GetItemCountAsync() {
        if (!this.HasProp("__IGameSaveContainerInfoQuery")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfoQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfoQuery := IGameSaveContainerInfoQuery(outPtr)
        }

        return this.__IGameSaveContainerInfoQuery.GetItemCountAsync()
    }

;@endregion Instance Methods
}
