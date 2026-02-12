#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlookerDetectionOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to manage the onlooker detection behavior of the PC.
 * @remarks
 * The user can specify their preferred onlooker detection behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.onlookerdetectionoptions
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class OnlookerDetectionOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOnlookerDetectionOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOnlookerDetectionOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the onlooker detection action behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.onlookerdetectionoptions.action
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
        set => this.put_Action(value)
    }

    /**
     * Gets or sets the onlooker detection back on mode setting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.onlookerdetectionoptions.backonmode
     * @type {Integer} 
     */
    BackOnMode {
        get => this.get_BackOnMode()
        set => this.put_BackOnMode(value)
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
    get_Action() {
        if (!this.HasProp("__IOnlookerDetectionOptions")) {
            if ((queryResult := this.QueryInterface(IOnlookerDetectionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlookerDetectionOptions := IOnlookerDetectionOptions(outPtr)
        }

        return this.__IOnlookerDetectionOptions.get_Action()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Action(value) {
        if (!this.HasProp("__IOnlookerDetectionOptions")) {
            if ((queryResult := this.QueryInterface(IOnlookerDetectionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlookerDetectionOptions := IOnlookerDetectionOptions(outPtr)
        }

        return this.__IOnlookerDetectionOptions.put_Action(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackOnMode() {
        if (!this.HasProp("__IOnlookerDetectionOptions")) {
            if ((queryResult := this.QueryInterface(IOnlookerDetectionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlookerDetectionOptions := IOnlookerDetectionOptions(outPtr)
        }

        return this.__IOnlookerDetectionOptions.get_BackOnMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackOnMode(value) {
        if (!this.HasProp("__IOnlookerDetectionOptions")) {
            if ((queryResult := this.QueryInterface(IOnlookerDetectionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlookerDetectionOptions := IOnlookerDetectionOptions(outPtr)
        }

        return this.__IOnlookerDetectionOptions.put_BackOnMode(value)
    }

;@endregion Instance Methods
}
