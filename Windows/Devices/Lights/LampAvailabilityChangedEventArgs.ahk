#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampAvailabilityChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AvailabilityChanged](lamp_availabilitychanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampavailabilitychangedeventargs
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class LampAvailabilityChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampAvailabilityChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampAvailabilityChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the lamp device that triggered the event is available.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampavailabilitychangedeventargs.isavailable
     * @type {Boolean} 
     */
    IsAvailable {
        get => this.get_IsAvailable()
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
    get_IsAvailable() {
        if (!this.HasProp("__ILampAvailabilityChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampAvailabilityChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampAvailabilityChangedEventArgs := ILampAvailabilityChangedEventArgs(outPtr)
        }

        return this.__ILampAvailabilityChangedEventArgs.get_IsAvailable()
    }

;@endregion Instance Methods
}
