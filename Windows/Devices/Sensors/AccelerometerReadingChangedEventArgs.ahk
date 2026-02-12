#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccelerometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the accelerometer reading– changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](accelerometer_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AccelerometerReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccelerometerReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccelerometerReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the most recent accelerometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreadingchangedeventargs.reading
     * @type {AccelerometerReading} 
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
     * @returns {AccelerometerReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IAccelerometerReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccelerometerReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerReadingChangedEventArgs := IAccelerometerReadingChangedEventArgs(outPtr)
        }

        return this.__IAccelerometerReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
