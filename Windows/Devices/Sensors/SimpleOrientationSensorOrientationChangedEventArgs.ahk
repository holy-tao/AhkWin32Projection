#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISimpleOrientationSensorOrientationChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the sensor reading–changed event.
 * @remarks
 * This object is accessed when your app supports the [OrientationChanged](simpleorientationsensor_orientationchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensororientationchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SimpleOrientationSensorOrientationChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISimpleOrientationSensorOrientationChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISimpleOrientationSensorOrientationChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time of the current sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensororientationchangedeventargs.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the current sensor orientation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensororientationchangedeventargs.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISimpleOrientationSensorOrientationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensorOrientationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensorOrientationChangedEventArgs := ISimpleOrientationSensorOrientationChangedEventArgs(outPtr)
        }

        return this.__ISimpleOrientationSensorOrientationChangedEventArgs.get_Timestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISimpleOrientationSensorOrientationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensorOrientationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensorOrientationChangedEventArgs := ISimpleOrientationSensorOrientationChangedEventArgs(outPtr)
        }

        return this.__ISimpleOrientationSensorOrientationChangedEventArgs.get_Orientation()
    }

;@endregion Instance Methods
}
