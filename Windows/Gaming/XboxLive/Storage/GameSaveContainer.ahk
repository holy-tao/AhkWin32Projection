#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveContainer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains a collection of data blobs that represent a single saved game.
 * @remarks
 * A GameSaveContainer represents a single saved game, and consists of a collection of data blobs that contain the save game data and are independently writable.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveContainer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveContainer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The name of this [GameSaveContainer](gamesavecontainer.md).
     * @remarks
     * The game save container name is used to identify containers created, updated, or returned by methods such as [CreateContainer](gamesaveprovider_createcontainer_1539970701.md), [DeleteContainerAsync](gamesaveprovider_deletecontainerasync_1360317562.md), [ContainersChangedSinceLastSync](gamesaveprovider_containerschangedsincelastsync.md), [CreateContainerInfoQuery](gamesaveprovider_createcontainerinfoquery_424994130.md), and [GetContainerInfoAsync](gamesavecontainerinfoquery_getcontainerinfoasync_1018947810.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * The provider that this container is stored in.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer.provider
     * @type {GameSaveProvider} 
     */
    Provider {
        get => this.get_Provider()
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
    get_Name() {
        if (!this.HasProp("__IGameSaveContainer")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainer := IGameSaveContainer(outPtr)
        }

        return this.__IGameSaveContainer.get_Name()
    }

    /**
     * 
     * @returns {GameSaveProvider} 
     */
    get_Provider() {
        if (!this.HasProp("__IGameSaveContainer")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainer := IGameSaveContainer(outPtr)
        }

        return this.__IGameSaveContainer.get_Provider()
    }

    /**
     * Submits a set of changes to the game save blobs in this container. Changes can be writes to blobs or the deletion of existing blobs. If the container doesn't exist, then a new one is created. All writes and updates are applied atomically. Attempting to write and delete the same blob results in an error. Only 16MB of data may be written per call.
     * @remarks
     * After the asynchronous operation completes, check the [Status](gamesaveoperationresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * 
     * Each TitleID/SCID is limited to a total of 256MB of storage per user.
     * 
     * When a title has reached its storage limit for a user, calls to **SubmitUpdatesAsync** will fail.
     * 
     * If a blob name or the display name exceeds the max length, the game save will fail to upload.
     * 
     * **SubmitUpdatesAsync** calls must not assume that a future **SubmitUpdatesAsync** call will be completed successfully in order to leave the container in a valid state. Each **SubmitUpdatesAsync** call must leave the contents of the specified container in a valid state for the app to read later. For example, if a player purchases food with gold in a game, the new values for the gold and food should be updated in the same call to **SubmitUpdatesAsync**. This ensures that both values will be updated at the same time or in the event of a power failure or some other event preventing the update, both food and gold will still have their original values.
     * @param {IMapView<HSTRING, IBuffer>} blobsToWrite Type: **IMapView\<;String, IBuffer>;** \[JavaScript/C++\] | [System.Collections.Generic.IReadOnlyDictionary\<;String, IBuffer>;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\]
     * 
     * Collection of blob names and the data to write for each blob. The max length for a blob name is 63 characters.
     * @param {IIterable<HSTRING>} blobsToDelete Type: **IIterable\<;String>;** \[JavaScript/C++\] | [System.Collections.Generic.IEnumerable\<;String>;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\]
     * 
     * Collection containing the string names of blobs to delete. The max length for a blob name is 63 characters.
     * @param {HSTRING} displayName Type: **String** \[JavaScript\] | [System.String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\] | [Platform::String](/cpp/cppcx/platform-string-class) \[C++\]
     * 
     * The save game container's display name. Set this to the name that will be displayed for the game save. The max length for the display name is 127 characters.
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer.submitupdatesasync
     */
    SubmitUpdatesAsync(blobsToWrite, blobsToDelete, displayName) {
        if (!this.HasProp("__IGameSaveContainer")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainer := IGameSaveContainer(outPtr)
        }

        return this.__IGameSaveContainer.SubmitUpdatesAsync(blobsToWrite, blobsToDelete, displayName)
    }

    /**
     * Reads blobs from this container, as specified by *blobsToRead*. The buffers passed in *blobsToRead* must be large enough to store the blob data.
     * @remarks
     * Use [GameSaveBlobInfoQuery](gamesaveblobinfoquery.md) to determine the required buffer size for each game save blob requested.
     * 
     * If the operation completes successfully, the length property of the returned buffers specifies the amount of data contained in each buffer.
     * 
     * **ReadAsync** differs from [GetAsync](gamesavecontainer_getasync_465620582.md) in that **GetAsync** automatically allocates the required buffers for the blob data, and returns that data in a [GameSaveBlobGetResult](gamesaveblobgetresult.md) object. **ReadAsync** instead writes directly into the buffers passed in the *blobsToRead* parameter.
     * 
     * After the asynchronous operation completes, check the [Status](gamesaveoperationresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @param {IMapView<HSTRING, IBuffer>} blobsToRead Type: **IMapView\<;String, IBuffer>;** \[JavaScript/C++\] | [System.Collections.Generic.IReadOnlyDictionary\<;String, IBuffer>;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\]
     * 
     * Collection of blob names and data buffers to receive blob data.
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer.readasync
     */
    ReadAsync(blobsToRead) {
        if (!this.HasProp("__IGameSaveContainer")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainer := IGameSaveContainer(outPtr)
        }

        return this.__IGameSaveContainer.ReadAsync(blobsToRead)
    }

    /**
     * Asynchronously retrieves blobs from the container.
     * @remarks
     * GetAsync allocates new buffers to store the returned data.
     * 
     * After the asynchronous operation completes, check the [Status](gamesaveblobgetresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @param {IIterable<HSTRING>} blobsToRead Type: **IIterable\<;String>;** \[JavaScript/C++\] | [System.Collections.Generic.IEnumerable\<;String>;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\]
     * 
     * String names of the blobs to read
     * @returns {IAsyncOperation<GameSaveBlobGetResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer.getasync
     */
    GetAsync(blobsToRead) {
        if (!this.HasProp("__IGameSaveContainer")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainer := IGameSaveContainer(outPtr)
        }

        return this.__IGameSaveContainer.GetAsync(blobsToRead)
    }

    /**
     * Similar to [SubmitUpdatesAsync](gamesavecontainer_submitupdatesasync_1002100950.md), except that this method operates on a **PropertySet** instead of a mapped view (or dictionary in C\#).
     * @remarks
     * This method can be called from JavaScript, unlike [SubmitUpdatesAsync](gamesavecontainer_submitupdatesasync_1002100950.md) which requires creating a mapped view (or dictionary in C\#).
     * 
     * *blobsToWrite* is a **PropertySet** that should contain key-value pairs of a blob name and a Windows.Storage.Streams.IBuffer (Windows.Storage.Streams.DataWriter, for example).
     * 
     * After the asynchronous operation completes, check the [Status](gamesaveoperationresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @param {IPropertySet} blobsToWrite Type: [IPropertySet](../windows.foundation.collections/ipropertyset.md)
     * 
     * Collection of blob names and the data to write for each blob.
     * @param {IIterable<HSTRING>} blobsToDelete Type: **IIterable\<;String>;** \[JavaScript/C++\] | [System.Collections.Generic.IEnumerable\<;String>;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\]
     * 
     * Collection containing the string names of blobs to delete.
     * @param {HSTRING} displayName Type: **String** \[JavaScript\] | [System.String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\] | [Platform::String](/cpp/cppcx/platform-string-class) \[C++\]
     * 
     * The save game container's display name. Set this to the name that will be displayed for the game save.
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer.submitpropertysetupdatesasync
     */
    SubmitPropertySetUpdatesAsync(blobsToWrite, blobsToDelete, displayName) {
        if (!this.HasProp("__IGameSaveContainer")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainer := IGameSaveContainer(outPtr)
        }

        return this.__IGameSaveContainer.SubmitPropertySetUpdatesAsync(blobsToWrite, blobsToDelete, displayName)
    }

    /**
     * Creates a [GameSaveBlobInfoQuery](gamesaveblobinfoquery.md) instance that retrieves the game save blobs within this container with names that begin with the specified prefix.
     * @remarks
     * If *blobNamePrefix* is null or empty the query matches all blobs in the container. Otherwise, it matches the blobs with names that begin with *blobNamePrefix*.
     * @param {HSTRING} blobNamePrefix Type: **String** \[JavaScript\] | [System.String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\] | [Platform::String](/cpp/cppcx/platform-string-class) \[C++\]
     * 
     * String name prefix of the blobs to retrieve.
     * @returns {GameSaveBlobInfoQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainer.createblobinfoquery
     */
    CreateBlobInfoQuery(blobNamePrefix) {
        if (!this.HasProp("__IGameSaveContainer")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainer := IGameSaveContainer(outPtr)
        }

        return this.__IGameSaveContainer.CreateBlobInfoQuery(blobNamePrefix)
    }

;@endregion Instance Methods
}
