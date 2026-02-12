#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveOperationResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Result of an asynchronous game save operation.
 * @remarks
 * **GameSaveOperationResult** is returned when an asynchronous game save operation completes, and contains the status result of the operation.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveoperationresult
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveOperationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Status result of an asynchronous game save operation.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesaveoperationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
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
        if (!this.HasProp("__IGameSaveOperationResult")) {
            if ((queryResult := this.QueryInterface(IGameSaveOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveOperationResult := IGameSaveOperationResult(outPtr)
        }

        return this.__IGameSaveOperationResult.get_Status()
    }

;@endregion Instance Methods
}
