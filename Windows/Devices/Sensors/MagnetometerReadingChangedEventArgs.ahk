#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagnetometerReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the magnetometer reading– changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](magnetometer_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class MagnetometerReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagnetometerReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagnetometerReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current magnetometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreadingchangedeventargs.reading
     * @type {MagnetometerReading} 
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
     * @returns {MagnetometerReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IMagnetometerReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReadingChangedEventArgs := IMagnetometerReadingChangedEventArgs(outPtr)
        }

        return this.__IMagnetometerReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
