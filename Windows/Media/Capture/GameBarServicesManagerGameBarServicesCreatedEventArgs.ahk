#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameBarServicesManagerGameBarServicesCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [GameBarServicesManager.GameBarServicesCreated](./gamebarservicesmanager_gamebarservicescreated.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicesmanagergamebarservicescreatedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarServicesManagerGameBarServicesCreatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameBarServicesManagerGameBarServicesCreatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameBarServicesManagerGameBarServicesCreatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [GameBarServices](./gamebarservices.md) associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicesmanagergamebarservicescreatedeventargs.gamebarservices
     * @type {GameBarServices} 
     */
    GameBarServices {
        get => this.get_GameBarServices()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GameBarServices} 
     */
    get_GameBarServices() {
        if (!this.HasProp("__IGameBarServicesManagerGameBarServicesCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesManagerGameBarServicesCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesManagerGameBarServicesCreatedEventArgs := IGameBarServicesManagerGameBarServicesCreatedEventArgs(outPtr)
        }

        return this.__IGameBarServicesManagerGameBarServicesCreatedEventArgs.get_GameBarServices()
    }

;@endregion Instance Methods
}
