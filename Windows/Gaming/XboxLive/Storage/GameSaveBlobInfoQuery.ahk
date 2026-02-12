#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveBlobInfoQuery.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enumerates the blobs in a GameSaveContainer.
 * @remarks
 * Use [GameSaveContainer.CreateBlobInfoQuery](gamesavecontainer_createblobinfoquery_1392439372.md) to create a **GameSaveBlobInfoQuery** instance.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfoquery
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveBlobInfoQuery extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveBlobInfoQuery

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveBlobInfoQuery.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously retrieves information for all blobs that match this query.
     * @remarks
     * After the asynchronous operation completes, check the [Status](gamesaveblobinfogetresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @returns {IAsyncOperation<GameSaveBlobInfoGetResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfoquery.getblobinfoasync
     */
    GetBlobInfoAsync() {
        if (!this.HasProp("__IGameSaveBlobInfoQuery")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobInfoQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobInfoQuery := IGameSaveBlobInfoQuery(outPtr)
        }

        return this.__IGameSaveBlobInfoQuery.GetBlobInfoAsync()
    }

    /**
     * Asynchronously retrieves information for all blobs that match this query.
     * @remarks
     * After the asynchronous operation completes, check the [Status](gamesaveblobinfogetresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<GameSaveBlobInfoGetResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfoquery.getblobinfoasync
     */
    GetBlobInfoWithIndexAndMaxAsync(startIndex, maxNumberOfItems) {
        if (!this.HasProp("__IGameSaveBlobInfoQuery")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobInfoQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobInfoQuery := IGameSaveBlobInfoQuery(outPtr)
        }

        return this.__IGameSaveBlobInfoQuery.GetBlobInfoWithIndexAndMaxAsync(startIndex, maxNumberOfItems)
    }

    /**
     * Retrieves the number of blobs that match the query that created this [GameSaveBlobInfoQuery](gamesaveblobinfoquery.md) object.
     * @remarks
     * After the asynchronous operation completes, the operation result of the returned **IAsyncOperation** object contains the number of blobs that match this query.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfoquery.getitemcountasync
     */
    GetItemCountAsync() {
        if (!this.HasProp("__IGameSaveBlobInfoQuery")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobInfoQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobInfoQuery := IGameSaveBlobInfoQuery(outPtr)
        }

        return this.__IGameSaveBlobInfoQuery.GetItemCountAsync()
    }

;@endregion Instance Methods
}
