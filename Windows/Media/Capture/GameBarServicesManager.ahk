#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameBarServicesManager.ahk
#Include .\IGameBarServicesManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GameBarServicesManager.ahk
#Include .\GameBarServicesManagerGameBarServicesCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Manages the Game Bar services.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicesmanager
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarServicesManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameBarServicesManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameBarServicesManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default instance of the [GameBarServiceManager](./gamebarservicesmanager.md) class.
     * @returns {GameBarServicesManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicesmanager.getdefault
     */
    static GetDefault() {
        if (!GameBarServicesManager.HasProp("__IGameBarServicesManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.GameBarServicesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameBarServicesManagerStatics.IID)
            GameBarServicesManager.__IGameBarServicesManagerStatics := IGameBarServicesManagerStatics(factoryPtr)
        }

        return GameBarServicesManager.__IGameBarServicesManagerStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnGameBarServicesCreatedToken")) {
            this.remove_GameBarServicesCreated(this.__OnGameBarServicesCreatedToken)
            this.__OnGameBarServicesCreated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<GameBarServicesManager, GameBarServicesManagerGameBarServicesCreatedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_GameBarServicesCreated(value) {
        if (!this.HasProp("__IGameBarServicesManager")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesManager := IGameBarServicesManager(outPtr)
        }

        return this.__IGameBarServicesManager.add_GameBarServicesCreated(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GameBarServicesCreated(token) {
        if (!this.HasProp("__IGameBarServicesManager")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesManager := IGameBarServicesManager(outPtr)
        }

        return this.__IGameBarServicesManager.remove_GameBarServicesCreated(token)
    }

;@endregion Instance Methods
}
