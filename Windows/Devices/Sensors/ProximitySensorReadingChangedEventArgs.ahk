#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProximitySensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the reading– changed event of the proximity sensor.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](proximitysensor_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensorreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ProximitySensorReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProximitySensorReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProximitySensorReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the most recent proximity sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensorreadingchangedeventargs.reading
     * @type {ProximitySensorReading} 
     */
    Reading {
        get => this.get_Reading()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ProximitySensorReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IProximitySensorReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IProximitySensorReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensorReadingChangedEventArgs := IProximitySensorReadingChangedEventArgs(outPtr)
        }

        return this.__IProximitySensorReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
