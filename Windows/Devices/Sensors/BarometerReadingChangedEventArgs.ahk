#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the barometer reading– changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](barometer_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class BarometerReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarometerReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarometerReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the most recent barometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerreadingchangedeventargs.reading
     * @type {BarometerReading} 
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
     * @returns {BarometerReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IBarometerReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarometerReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarometerReadingChangedEventArgs := IBarometerReadingChangedEventArgs(outPtr)
        }

        return this.__IBarometerReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
