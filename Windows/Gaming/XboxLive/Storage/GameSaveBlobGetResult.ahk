#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveBlobGetResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A collection of named game save blobs retrieved from a [GameSaveContainer](gamesavecontainer.md).
 * @remarks
 * **GameSaveBlobGetResult** is returned when [GameSaveContainer.GetAsync](gamesavecontainer_getasync_465620582.md) completes, and contains the result of the asynchronous operation. If the operation completed with no errors, [GameSaveBlobGetResult.Value](gamesaveblobgetresult_value.md) contains the game save data.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobgetresult
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveBlobGetResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveBlobGetResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveBlobGetResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status result of the asynchronous game save blob request.
     * @remarks
     * If Status is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md), the operation completed successfully and [GameSaveBlobGetResult.Value](gamesaveblobgetresult_value.md) is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobgetresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Collection of named game save blobs.
     * @remarks
     * **Value** is valid only if [GameSaveBlobGetResult.Status](gamesaveblobgetresult_status.md) is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveblobgetresult.value
     * @type {IMapView<HSTRING, IBuffer>} 
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
        if (!this.HasProp("__IGameSaveBlobGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobGetResult := IGameSaveBlobGetResult(outPtr)
        }

        return this.__IGameSaveBlobGetResult.get_Status()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IBuffer>} 
     */
    get_Value() {
        if (!this.HasProp("__IGameSaveBlobGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveBlobGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveBlobGetResult := IGameSaveBlobGetResult(outPtr)
        }

        return this.__IGameSaveBlobGetResult.get_Value()
    }

;@endregion Instance Methods
}
