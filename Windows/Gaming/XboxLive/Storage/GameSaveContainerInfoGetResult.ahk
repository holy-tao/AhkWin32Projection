#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveContainerInfoGetResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Result of a [GameSaveContainerInfoQuery](gamesavecontainerinfoquery.md) operation.
 * @remarks
 * **GameSaveContainerInfoGetResult** is returned when [GameSaveContainerInfoQuery.GetContainerInfoAsync](gamesavecontainerinfoquery_getcontainerinfoasync_1018947810.md) completes, and contains the result of the asynchronous operation. If the operation completed with no errors, [GameSaveContainerInfoGetResult.Value](gamesavecontainerinfogetresult_value.md) has the container info.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfogetresult
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveContainerInfoGetResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveContainerInfoGetResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveContainerInfoGetResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Status result of the asynchronous game save container info request.
     * @remarks
     * If **Status** is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md), the operation completed successfully and [GameSaveContainerInfoGetResult.Value](gamesavecontainerinfogetresult_value.md) is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfogetresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * A collection of container information returned by [GameSaveContainerInfoQuery](gamesavecontainerinfoquery.md).
     * @remarks
     * **Value** is valid only if [GameSaveContainerInfoGetResult.Status](gamesavecontainerinfogetresult_status.md) is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfogetresult.value
     * @type {IVectorView<GameSaveContainerInfo>} 
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
        if (!this.HasProp("__IGameSaveContainerInfoGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfoGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfoGetResult := IGameSaveContainerInfoGetResult(outPtr)
        }

        return this.__IGameSaveContainerInfoGetResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<GameSaveContainerInfo>} 
     */
    get_Value() {
        if (!this.HasProp("__IGameSaveContainerInfoGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfoGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfoGetResult := IGameSaveContainerInfoGetResult(outPtr)
        }

        return this.__IGameSaveContainerInfoGetResult.get_Value()
    }

;@endregion Instance Methods
}
