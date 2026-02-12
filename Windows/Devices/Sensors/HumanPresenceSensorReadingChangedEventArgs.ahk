#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHumanPresenceSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [HumanPresenceSensor.ReadingChanged](humanpresencesensor_readingchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanPresenceSensorReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHumanPresenceSensorReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHumanPresenceSensorReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the human presence sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingchangedeventargs.reading
     * @type {HumanPresenceSensorReading} 
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
     * @returns {HumanPresenceSensorReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IHumanPresenceSensorReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingChangedEventArgs := IHumanPresenceSensorReadingChangedEventArgs(outPtr)
        }

        return this.__IHumanPresenceSensorReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
