#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveProviderGetResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Result of a [GetForUserAsync](gamesaveprovider_getforuserasync_1027182495.md) or [GetSyncOnDemandForUserAsync](gamesaveprovider_getsyncondemandforuserasync_1696921570.md). operation.
 * @remarks
 * **GameSaveProviderGetResult** is returned when [GetForUserAsync](gamesaveprovider_getforuserasync_1027182495.md) or [GetSyncOnDemandForUserAsync](gamesaveprovider_getsyncondemandforuserasync_1696921570.md). completes, and contains the result of the asynchronous operation. If the operation completed with no errors, [GameSaveProviderGetResult.Value](gamesaveprovidergetresult_value.md) contains the game save provider.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovidergetresult
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveProviderGetResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveProviderGetResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveProviderGetResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Status result of the asynchronous game save provider request.
     * @remarks
     * If **Status** is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md), the operation completed successfully and [GameSaveProviderGetResult.Value](gamesaveprovidergetresult_value.md) is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovidergetresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * [GameSaveProvider](gamesaveprovider.md) instance returned by a successful game save provider request.
     * @remarks
     * **Value** is valid only if [GameSaveProviderGetResult.Status](gamesaveprovidergetresult_status.md) is [GameSaveErrorStatus.Ok](gamesaveerrorstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveprovidergetresult.value
     * @type {GameSaveProvider} 
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
        if (!this.HasProp("__IGameSaveProviderGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveProviderGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProviderGetResult := IGameSaveProviderGetResult(outPtr)
        }

        return this.__IGameSaveProviderGetResult.get_Status()
    }

    /**
     * 
     * @returns {GameSaveProvider} 
     */
    get_Value() {
        if (!this.HasProp("__IGameSaveProviderGetResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveProviderGetResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveProviderGetResult := IGameSaveProviderGetResult(outPtr)
        }

        return this.__IGameSaveProviderGetResult.get_Value()
    }

;@endregion Instance Methods
}
