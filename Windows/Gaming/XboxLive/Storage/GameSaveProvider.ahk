#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveProvider.ahk
#Include .\IGameSaveProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **GameSaveProvider** is used to create, save, enumerate, and load Xbox Live game saves.
 * @remarks
 * Call [GetForUserAsync](gamesaveprovider_getforuserasync_1027182495.md) or [GetSyncOnDemandForUserAsync](gamesaveprovider_getsyncondemandforuserasync_1696921570.md) to obtain a **GameSaveProvider** instance.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a game save provider for the specified user.
     * @remarks
     * GetForUserAsync obtains a [GameSaveProvider](gamesaveprovider.md) instance for the specified user. After the asynchronous operation completes, check the [Status](gamesaveprovidergetresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * 
     * Your title ID and service configuration ID (SCID) must be properly configured or this method will fail.
     * @param {User} user_ Type: [User](../windows.system/user.md)
     * 
     * User who the game saves are for.
     * @param {HSTRING} serviceConfigId Type: **String** \[JavaScript\] | [System.String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\] | [Platform::String](/cpp/cppcx/platform-string-class) \[C++\]
     * 
     * The service configuration ID (SCID) used by your game.
     * @returns {IAsyncOperation<GameSaveProviderGetResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.getforuserasync
     */
    static GetForUserAsync(user_, serviceConfigId) {
        if (!GameSaveProvider.HasProp("__IGameSaveProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.XboxLive.Storage.GameSaveProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameSaveProviderStatics.IID)
            GameSaveProvider.__IGameSaveProviderStatics := IGameSaveProviderStatics(factoryPtr)
        }

        return GameSaveProvider.__IGameSaveProviderStatics.GetForUserAsync(user_, serviceConfigId)
    }

    /**
     * Gets a partially-synced game save provider that syncs containers on demand.
     * @remarks
     * A sync-on-demand provider is not guaranteed to have all containers synced locally. A sync is required when there is a conflict the user must resolve, or, more commonly, when the container has newer data in the cloud that must be downloaded. This condition is indicated by [GameSaveContainerInfo.NeedsSync](gamesavecontainerinfo_needssync.md).
     * 
     * Calls to read, delete, or query blobs from a container will sync the container if it needs to sync.
     * 
     * Attempts to submit updates to a container will fail (with [GameSaveErrorStatus.ContainerNotInSync](gamesaveerrorstatus.md)) while the container still needs to sync.
     * 
     * **GetSyncOnDemandForUserAsync** obtains a [GameSaveProvider](gamesaveprovider.md) instance for the specified user. After the asynchronous operation completes, check the [Status](gamesaveprovidergetresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * 
     * Your title ID and service configuration ID (SCID) must be properly configured or this method will fail.
     * @param {User} user_ Type: [User](../windows.system/user.md)
     * 
     * User who the game saves are for.
     * @param {HSTRING} serviceConfigId Type: **String** \[JavaScript\] | [System.String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\] | [Platform::String](/cpp/cppcx/platform-string-class) \[C++\]
     * 
     * The service configuration ID (SCID) used by your game.
     * @returns {IAsyncOperation<GameSaveProviderGetResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.getsyncondemandforuserasync
     */
    static GetSyncOnDemandForUserAsync(user_, serviceConfigId) {
        if (!GameSaveProvider.HasProp("__IGameSaveProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.XboxLive.Storage.GameSaveProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameSaveProviderStatics.IID)
            GameSaveProvider.__IGameSaveProviderStatics := IGameSaveProviderStatics(factoryPtr)
        }

        return GameSaveProvider.__IGameSaveProviderStatics.GetSyncOnDemandForUserAsync(user_, serviceConfigId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * User associated with this game save provider and its game save containers.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Called on a new [GameSaveProvider](gamesaveprovider.md) instance, returns the names of containers that have changed since the application last ran.
     * @remarks
     * Game save containers can be written to from another device while an application is suspended or terminated. When the application resumes, **ContainersChangedSinceLastSync** will indicate the containers that were changed.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.containerschangedsincelastsync
     * @type {IVectorView<HSTRING>} 
     */
    ContainersChangedSinceLastSync {
        get => this.get_ContainersChangedSinceLastSync()
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
        if (!this.HasProp("__IGameSaveProvider")) {
            if ((queryResult := this.QueryInterface(IGameSaveProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProvider := IGameSaveProvider(outPtr)
        }

        return this.__IGameSaveProvider.get_User()
    }

    /**
     * Creates a new [GameSaveContainer](gamesavecontainer.md) to store a game save.
     * @remarks
     * Valid characters for the path portion of the container name (up to and including the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (\_), and forward slash (/). The path portion may be empty.
     * 
     * Valid characters for the filename portion (everything after the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (\_), period (.), and hyphen (-). The filename may not be empty, end in a period, or contain two consecutive periods.
     * 
     * If *name* is invalid, the operation fails with [GameSaveErrorStatus.InvalidContainerName](gamesaveerrorstatus.md).
     * 
     * The string specified in *name* is used to programmatically refer to the game save, and is not the display name shown to the user.
     * 
     * The returned [GameSaveContainer](gamesavecontainer.md) is empty and contains no game save blobs.
     * 
     * Use [GameSaveContainer.SubmitUpdatesAsync](gamesavecontainer_submitupdatesasync_1002100950.md) to write game save blobs to the container.
     * @param {HSTRING} name Type: **String** \[JavaScript\] | [System.String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\] | [Platform::String](/cpp/cppcx/platform-string-class) \[C++\]
     * 
     * Name of the new game save container. The maximum length for the container name is 256 characters.
     * @returns {GameSaveContainer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.createcontainer
     */
    CreateContainer(name) {
        if (!this.HasProp("__IGameSaveProvider")) {
            if ((queryResult := this.QueryInterface(IGameSaveProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProvider := IGameSaveProvider(outPtr)
        }

        return this.__IGameSaveProvider.CreateContainer(name)
    }

    /**
     * Asynchronously deletes the specified game save container.
     * @remarks
     * After the asynchronous operation completes, check the [Status](gamesaveoperationresult_status.md) property of the result to determine whether the operation succeeded with [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @param {HSTRING} name Type: **String** \[JavaScript\] | [System.String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) \[.NET\] | [Platform::String](/cpp/cppcx/platform-string-class) \[C++\]
     * 
     * String name of the container to delete.
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.deletecontainerasync
     */
    DeleteContainerAsync(name) {
        if (!this.HasProp("__IGameSaveProvider")) {
            if ((queryResult := this.QueryInterface(IGameSaveProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProvider := IGameSaveProvider(outPtr)
        }

        return this.__IGameSaveProvider.DeleteContainerAsync(name)
    }

    /**
     * Creates a [GameSaveContainerInfoQuery](gamesavecontainerinfoquery.md) instance that enumerates the containers in this game save provider that have names that begin with the specified prefix.
     * @remarks
     * Call [GetContainerInfoAsync](gamesavecontainerinfoquery_getcontainerinfoasync_1018947810.md) on the returned object to retrieve container information.
     * @returns {GameSaveContainerInfoQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.createcontainerinfoquery
     */
    CreateContainerInfoQuery() {
        if (!this.HasProp("__IGameSaveProvider")) {
            if ((queryResult := this.QueryInterface(IGameSaveProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProvider := IGameSaveProvider(outPtr)
        }

        return this.__IGameSaveProvider.CreateContainerInfoQuery()
    }

    /**
     * Creates a [GameSaveContainerInfoQuery](gamesavecontainerinfoquery.md) instance that enumerates all containers in this game save provider.
     * @remarks
     * Call [GetContainerInfoAsync](gamesavecontainerinfoquery_getcontainerinfoasync_1018947810.md) on the returned object to retrieve container information. Containers are enumerated in order of the most recently modified first.
     * @param {HSTRING} containerNamePrefix 
     * @returns {GameSaveContainerInfoQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.createcontainerinfoquery
     */
    CreateContainerInfoQueryWithName(containerNamePrefix) {
        if (!this.HasProp("__IGameSaveProvider")) {
            if ((queryResult := this.QueryInterface(IGameSaveProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProvider := IGameSaveProvider(outPtr)
        }

        return this.__IGameSaveProvider.CreateContainerInfoQueryWithName(containerNamePrefix)
    }

    /**
     * Get the bytes remaining in the user's quota for this game save provider.
     * @remarks
     * Each user has a per-game quota of data that can be stored in connected storage
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovider.getremainingbytesinquotaasync
     */
    GetRemainingBytesInQuotaAsync() {
        if (!this.HasProp("__IGameSaveProvider")) {
            if ((queryResult := this.QueryInterface(IGameSaveProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProvider := IGameSaveProvider(outPtr)
        }

        return this.__IGameSaveProvider.GetRemainingBytesInQuotaAsync()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ContainersChangedSinceLastSync() {
        if (!this.HasProp("__IGameSaveProvider")) {
            if ((queryResult := this.QueryInterface(IGameSaveProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProvider := IGameSaveProvider(outPtr)
        }

        return this.__IGameSaveProvider.get_ContainersChangedSinceLastSync()
    }

;@endregion Instance Methods
}
