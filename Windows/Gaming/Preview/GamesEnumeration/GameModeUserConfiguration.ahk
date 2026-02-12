#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameModeUserConfiguration.ahk
#Include .\IGameModeUserConfigurationStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides mechanism to add other gaming related processes and utilities that will get priority scheduling over other processes with Game Mode applied.
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeuserconfiguration
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class GameModeUserConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameModeUserConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameModeUserConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the current [GamingRelatedProcessNames](gamemodeuserconfiguration_gamingrelatedprocessnames.md)
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {GameModeUserConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeuserconfiguration.getdefault
     */
    static GetDefault() {
        if (!GameModeUserConfiguration.HasProp("__IGameModeUserConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Preview.GamesEnumeration.GameModeUserConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameModeUserConfigurationStatics.IID)
            GameModeUserConfiguration.__IGameModeUserConfigurationStatics := IGameModeUserConfigurationStatics(factoryPtr)
        }

        return GameModeUserConfiguration.__IGameModeUserConfigurationStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Returns a list of gaming related processes that will not be affected by Game Mode. Processes names can be added and removed, however SaveAsync() will need to be called to persist the changes.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeuserconfiguration.gamingrelatedprocessnames
     * @type {IVector<HSTRING>} 
     */
    GamingRelatedProcessNames {
        get => this.get_GamingRelatedProcessNames()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_GamingRelatedProcessNames() {
        if (!this.HasProp("__IGameModeUserConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeUserConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeUserConfiguration := IGameModeUserConfiguration(outPtr)
        }

        return this.__IGameModeUserConfiguration.get_GamingRelatedProcessNames()
    }

    /**
     * Saves the changes to the [GamingRelatedProcessNames](gamemodeuserconfiguration_gamingrelatedprocessnames.md) property.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeuserconfiguration.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IGameModeUserConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeUserConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeUserConfiguration := IGameModeUserConfiguration(outPtr)
        }

        return this.__IGameModeUserConfiguration.SaveAsync()
    }

;@endregion Instance Methods
}
