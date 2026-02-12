#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAltimeterReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the altimeter reading– changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](altimeter_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeterreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AltimeterReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAltimeterReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAltimeterReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the most recent barometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeterreadingchangedeventargs.reading
     * @type {AltimeterReading} 
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
     * @returns {AltimeterReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IAltimeterReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAltimeterReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeterReadingChangedEventArgs := IAltimeterReadingChangedEventArgs(outPtr)
        }

        return this.__IAltimeterReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
