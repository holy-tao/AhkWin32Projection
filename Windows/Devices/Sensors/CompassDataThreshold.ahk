#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompassDataThreshold.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to compass data thresholds (also known as change sensitivity).
 * @remarks
 * The threshold values are used to configure how the sensor hardware filters data sent to applications. Applications can configure thresholds to let the hardware filter out any irrelevant changes in the sensor data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassdatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class CompassDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompassDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompassDataThreshold.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum amount of directional change required to reach the threshold, measured in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassdatathreshold.degrees
     * @type {Float} 
     */
    Degrees {
        get => this.get_Degrees()
        set => this.put_Degrees(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Degrees() {
        if (!this.HasProp("__ICompassDataThreshold")) {
            if ((queryResult := this.QueryInterface(ICompassDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassDataThreshold := ICompassDataThreshold(outPtr)
        }

        return this.__ICompassDataThreshold.get_Degrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Degrees(value) {
        if (!this.HasProp("__ICompassDataThreshold")) {
            if ((queryResult := this.QueryInterface(ICompassDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassDataThreshold := ICompassDataThreshold(outPtr)
        }

        return this.__ICompassDataThreshold.put_Degrees(value)
    }

;@endregion Instance Methods
}
