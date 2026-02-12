#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompassReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the  compass reading–changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](compass_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class CompassReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompassReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompassReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current compass reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreadingchangedeventargs.reading
     * @type {CompassReading} 
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
     * @returns {CompassReading} 
     */
    get_Reading() {
        if (!this.HasProp("__ICompassReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICompassReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassReadingChangedEventArgs := ICompassReadingChangedEventArgs(outPtr)
        }

        return this.__ICompassReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
