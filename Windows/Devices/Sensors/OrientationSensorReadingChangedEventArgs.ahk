#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOrientationSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the orientation-sensor reading-changed event.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](orientationsensor_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class OrientationSensorReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOrientationSensorReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOrientationSensorReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current reading which includes a Quaternion, a RotationMatrix, and a timestamp.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreadingchangedeventargs.reading
     * @type {OrientationSensorReading} 
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
     * @returns {OrientationSensorReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IOrientationSensorReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorReadingChangedEventArgs := IOrientationSensorReadingChangedEventArgs(outPtr)
        }

        return this.__IOrientationSensorReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
