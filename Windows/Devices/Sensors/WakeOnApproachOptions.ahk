#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWakeOnApproachOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to manage the waking behavior of the PC screen based on whether a user is detected by the human presence sensor.
 * @remarks
 * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
 * 
 * The user can specify their preferred wake behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.wakeonapproachoptions
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class WakeOnApproachOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWakeOnApproachOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWakeOnApproachOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether wake behavior is enabled when an external monitor is connected to the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.wakeonapproachoptions.allowwhenexternaldisplayconnected
     * @type {Boolean} 
     */
    AllowWhenExternalDisplayConnected {
        get => this.get_AllowWhenExternalDisplayConnected()
        set => this.put_AllowWhenExternalDisplayConnected(value)
    }

    /**
     * Gets or sets whether wake behavior is enabled when battery saver is active.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.wakeonapproachoptions.disablewhenbatterysaveron
     * @type {Boolean} 
     */
    DisableWhenBatterySaverOn {
        get => this.get_DisableWhenBatterySaverOn()
        set => this.put_DisableWhenBatterySaverOn(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowWhenExternalDisplayConnected() {
        if (!this.HasProp("__IWakeOnApproachOptions")) {
            if ((queryResult := this.QueryInterface(IWakeOnApproachOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWakeOnApproachOptions := IWakeOnApproachOptions(outPtr)
        }

        return this.__IWakeOnApproachOptions.get_AllowWhenExternalDisplayConnected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowWhenExternalDisplayConnected(value) {
        if (!this.HasProp("__IWakeOnApproachOptions")) {
            if ((queryResult := this.QueryInterface(IWakeOnApproachOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWakeOnApproachOptions := IWakeOnApproachOptions(outPtr)
        }

        return this.__IWakeOnApproachOptions.put_AllowWhenExternalDisplayConnected(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisableWhenBatterySaverOn() {
        if (!this.HasProp("__IWakeOnApproachOptions")) {
            if ((queryResult := this.QueryInterface(IWakeOnApproachOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWakeOnApproachOptions := IWakeOnApproachOptions(outPtr)
        }

        return this.__IWakeOnApproachOptions.get_DisableWhenBatterySaverOn()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DisableWhenBatterySaverOn(value) {
        if (!this.HasProp("__IWakeOnApproachOptions")) {
            if ((queryResult := this.QueryInterface(IWakeOnApproachOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWakeOnApproachOptions := IWakeOnApproachOptions(outPtr)
        }

        return this.__IWakeOnApproachOptions.put_DisableWhenBatterySaverOn(value)
    }

;@endregion Instance Methods
}
