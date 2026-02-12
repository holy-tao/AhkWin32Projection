#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPedometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the pedometer reading– changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](pedometer_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class PedometerReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPedometerReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPedometerReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the most recent pedometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerreadingchangedeventargs.reading
     * @type {PedometerReading} 
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
     * @returns {PedometerReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IPedometerReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPedometerReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometerReadingChangedEventArgs := IPedometerReadingChangedEventArgs(outPtr)
        }

        return this.__IPedometerReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
