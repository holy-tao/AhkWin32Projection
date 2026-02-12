#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveBlobInfoGetResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Result of a [GameSaveBlobInfoQuery.GetBlobInfoAsync](gamesaveblobinfoquery_getblobinfoasync_517889704.md) operation.
 * @remarks
 * GameSaveBlobInfoGetResult is returned when [GameSaveBlobInfoQuery.GetBlobInfoAsync](gamesaveblobinfoquery_getblobinfoasync_517889704.md) completes, and contains the result of the asynchronous operation. If the operation completed with no errors, [GameSaveBlobInfoGetResult.Value](gamesaveblobinfogetresult_value.md) contains the blob info.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfogetresult
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveBlobInfoGetResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveBlobInfoGetResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveBlobInfoGetResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Status result of the asynchronous game save blob info request.
     * @remarks
     * If **Status** is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md), the operation completed successfully and [GameSaveBlobInfoGetResult.Value](gamesaveblobinfogetresult_value.md) is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfogetresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Information about a blob returned by [GameSaveBlobInfoQuery](gamesaveblobinfoquery.md).
     * @remarks
     * **Value** is valid only if [GameSaveBlobInfoGetResult.Status](gamesaveblobinfogetresult_status.md) is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobinfogetresult.value
     * @type {IVectorView<GameSaveBlobInfo>} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IGameSaveBlobInfoGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobInfoGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobInfoGetResult := IGameSaveBlobInfoGetResult(outPtr)
        }

        return this.__IGameSaveBlobInfoGetResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<GameSaveBlobInfo>} 
     */
    get_Value() {
        if (!this.HasProp("__IGameSaveBlobInfoGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobInfoGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobInfoGetResult := IGameSaveBlobInfoGetResult(outPtr)
        }

        return this.__IGameSaveBlobInfoGetResult.get_Value()
    }

;@endregion Instance Methods
}
