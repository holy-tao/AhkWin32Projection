#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICustomSensorReadingChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents data for the reading– changed event of the custom sensor.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](customsensor_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensorreadingchangedeventargs
 * @namespace Windows.Devices.Sensors.Custom
 * @version WindowsRuntime 1.4
 */
class CustomSensorReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomSensorReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomSensorReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the most recent sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensorreadingchangedeventargs.reading
     * @type {CustomSensorReading} 
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
     * @returns {CustomSensorReading} 
     */
    get_Reading() {
        if (!this.HasProp("__ICustomSensorReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICustomSensorReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensorReadingChangedEventArgs := ICustomSensorReadingChangedEventArgs(outPtr)
        }

        return this.__ICustomSensorReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
