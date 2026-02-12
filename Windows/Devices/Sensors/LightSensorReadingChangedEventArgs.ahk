#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILightSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the ambient-light sensor reading-changed event.
  * 
  * <!--That's a pretty complex noun stack, with lots of potential hyphens and en dashes. Can it be changed to something like "the event that was raised by the reading of the ambient-light sensor"?-->
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](lightsensor_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class LightSensorReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILightSensorReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILightSensorReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current ambient light-sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreadingchangedeventargs.reading
     * @type {LightSensorReading} 
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
     * @returns {LightSensorReading} 
     */
    get_Reading() {
        if (!this.HasProp("__ILightSensorReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILightSensorReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorReadingChangedEventArgs := ILightSensorReadingChangedEventArgs(outPtr)
        }

        return this.__ILightSensorReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
