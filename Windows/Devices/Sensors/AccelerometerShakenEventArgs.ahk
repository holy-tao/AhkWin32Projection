#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccelerometerShakenEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the accelerometer-shaken event.
 * @remarks
 * This object is accessed when your app supports the [Shaken](accelerometer_shaken.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometershakeneventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AccelerometerShakenEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccelerometerShakenEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccelerometerShakenEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the shaken event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometershakeneventargs.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
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
        if (!this.HasProp("__IAccelerometerShakenEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccelerometerShakenEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerShakenEventArgs := IAccelerometerShakenEventArgs(outPtr)
        }

        return this.__IAccelerometerShakenEventArgs.get_Timestamp()
    }

;@endregion Instance Methods
}
