#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Success and failure codes returned by game save operations.
 * @remarks
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveerrorstatus
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveErrorStatus extends Win32Enum{

    /**
     * | **Ok** | **ok**                                         | 0          | The operation completed successfully. |
     * @type {Integer (Int32)}
     */
    static Ok => 0

    /**
     * | **Abort** | **abort**                                   | 0x80004004 | The operation was aborted. |
     * @type {Integer (Int32)}
     */
    static Abort => -2147467260

    /**
     * | **InvalidContainerName** | **invalidContainerName**     | 0x80830001 | The specified container name is empty, contains invalid characters, or is too long. |
     * @type {Integer (Int32)}
     */
    static InvalidContainerName => -2138898431

    /**
     * | **NoAccess** | **noAccess**                             | 0x80830002 | The operation failed because the title does not have write access to the container storage space. |
     * @type {Integer (Int32)}
     */
    static NoAccess => -2138898430

    /**
     * | **OutOfLocalStorage** | **outOfLocalStorage**           | 0x80830003 | The operation failed because there was not enough local storage available. Although the user was given the chance to free up some local storage they chose not to do so. |
     * @type {Integer (Int32)}
     */
    static OutOfLocalStorage => -2138898429

    /**
     * | **UserCanceled** | **userCanceled**                     | 0x80830004 | The operation failed because the user canceled it. |
     * @type {Integer (Int32)}
     */
    static UserCanceled => -2138898428

    /**
     * | **UpdateTooBig** | **updateTooBig**                     | 0x80830005 | The operation failed because the update contained more than 16MB of data. |
     * @type {Integer (Int32)}
     */
    static UpdateTooBig => -2138898427

    /**
     * | **QuotaExceeded** | **quotaExceeded**                   | 0x80830006 | The operation failed because the update would cause the storage space to exceed its quota. Use IGameSaveProvider.GetRemainingBytesInQuotaAsync to query the remaining quota space. |
     * @type {Integer (Int32)}
     */
    static QuotaExceeded => -2138898426

    /**
     * | **ProvidedBufferTooSmall** | **providedBufferTooSmall** | 0x80830007 | The operation failed because a buffer provided to read a blob was too small to receive the blob. |
     * @type {Integer (Int32)}
     */
    static ProvidedBufferTooSmall => -2138898425

    /**
     * | **BlobNotFound** | **blobNotFound**                     | 0x80830008 | The operation failed because a blob with the given name was not found in the container. |
     * @type {Integer (Int32)}
     */
    static BlobNotFound => -2138898424

    /**
     * | **NoXboxLiveInfo** | **noXboxLiveInfo**                 | 0x80830009 | The operation failed because the title does not have a proper title id or service configuration id. |
     * @type {Integer (Int32)}
     */
    static NoXboxLiveInfo => -2138898423

    /**
     * | **ContainerNotInSync** | **containerNotInSync**         | 0x8083000A | The operation failed because the container does not exist locally. This error can when submitting updates to a container that needs to sync, and a read, delete, or blob query has not been issued on the container. |
     * @type {Integer (Int32)}
     */
    static ContainerNotInSync => -2138898422

    /**
     * | **ContainerSyncFailed** | **containerSyncFailed**       | 0x8083000B | The operation failed because the container could not be synced. This indicates that the user canceled a container sync due to not wanting to wait, or due to network failure and the user did not retry. This error can be returned by [DeleteContainerAsync](gamesaveprovider_deletecontainerasync_1360317562.md), [ReadAsync](gamesavecontainer_readasync_130997576.md), [GetAsync](gamesavecontainer_getasync_465620582.md), or a [GameSaveBlobInfoQuery](gamesaveblobinfoquery.md) operation. |
     * @type {Integer (Int32)}
     */
    static ContainerSyncFailed => -2138898421

    /**
     * | **UserHasNoXboxLiveInfo** | **userHasNoXboxLiveInfo**   | 0x8083000C | The operation failed because there is no Xbox Live information associated with the user account. This error can returned by [GetForUserAsync](gamesaveprovider_getforuserasync_1027182495.md) or [GetSyncOnDemandForUserAsync](gamesaveprovider_getsyncondemandforuserasync_1696921570.md). |
     * @type {Integer (Int32)}
     */
    static UserHasNoXboxLiveInfo => -2138898420

    /**
     * | **ObjectExpired** | **objectExpired**                   | 0x8083000D | The operation failed because the app has been suspended and the object is no longer valid. To perform game save operations after resuming, the app must request a new [GameSaveProvider](gamesaveprovider.md) with [GetForUserAsync](gamesaveprovider_getforuserasync_1027182495.md) or [GetSyncOnDemandForUserAsync](gamesaveprovider_getsyncondemandforuserasync_1696921570.md). |
     * @type {Integer (Int32)}
     */
    static ObjectExpired => -2138898419
}
