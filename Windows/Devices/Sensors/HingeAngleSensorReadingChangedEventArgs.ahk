#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHingeAngleSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [ReadingChanged](hingeanglesensor_readingchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensorreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HingeAngleSensorReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHingeAngleSensorReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHingeAngleSensorReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data exposed by the hinge angle sensor in a dual-screen device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensorreadingchangedeventargs.reading
     * @type {HingeAngleReading} 
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
     * @returns {HingeAngleReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IHingeAngleSensorReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensorReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensorReadingChangedEventArgs := IHingeAngleSensorReadingChangedEventArgs(outPtr)
        }

        return this.__IHingeAngleSensorReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
