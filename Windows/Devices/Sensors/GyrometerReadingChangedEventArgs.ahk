#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGyrometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the gyrometer reading– changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](gyrometer_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class GyrometerReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGyrometerReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGyrometerReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current gyrometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreadingchangedeventargs.reading
     * @type {GyrometerReading} 
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
     * @returns {GyrometerReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IGyrometerReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGyrometerReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerReadingChangedEventArgs := IGyrometerReadingChangedEventArgs(outPtr)
        }

        return this.__IGyrometerReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
