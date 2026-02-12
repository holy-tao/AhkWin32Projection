#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveBlobInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a game save blob. Call [GameSaveBlobInfoQuery.GetBlobInfoAsync](gamesaveblobinfoquery_getblobinfoasync_517889704.md) to obtain a **GameSaveBlobInfo** instance.
 * @remarks
 * Call [GameSaveContainer.CreateBlobInfoQuery](gamesavecontainer_createblobinfoquery_1392439372.md) to create a [GameSaveBlobInfoQuery](gamesaveblobinfoquery.md) that contains **GameSaveBlobInfo** instances of the specified blobs.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfo
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveBlobInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveBlobInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveBlobInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Name of the blob.
     * @remarks
     * Blob names are used when writing blobs with [SubmitUpdatesAsync](gamesavecontainer_submitupdatesasync_1002100950.md) or [SubmitPropertySetUpdatesAsync](gamesavecontainer_submitpropertysetupdatesasync_435712146.md), to request blobs when calling [GameSaveContainer.GetAsync](gamesavecontainer_getasync_465620582.md) and [GameSaveContainer.ReadAsync](gamesavecontainer_readasync_130997576.md), to request blob info when calling [GameSaveContainer.CreateBlobInfoQuery](gamesavecontainer_createblobinfoquery_1392439372.md), and to identify blobs returned in [GameSaveBlobGetResult.Value](gamesaveblobgetresult_value.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfo.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Size, in bytes, of the blob.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfo.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
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
        if (!this.HasProp("__IGameSaveBlobInfo")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobInfo := IGameSaveBlobInfo(outPtr)
        }

        return this.__IGameSaveBlobInfo.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IGameSaveBlobInfo")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobInfo := IGameSaveBlobInfo(outPtr)
        }

        return this.__IGameSaveBlobInfo.get_Size()
    }

;@endregion Instance Methods
}
