#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGyrometerDataThreshold.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to gyrometer data thresholds (also known as change sensitivity).
 * @remarks
 * The threshold values are used to configure how the sensor hardware filters data sent to applications. Applications can configure thresholds to let the hardware filter out any irrelevant changes in the sensor data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerdatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class GyrometerDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGyrometerDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGyrometerDataThreshold.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum change of angular velocity around the x-axis required to reach the threshold, measured in degrees per second.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerdatathreshold.xaxisindegreespersecond
     * @type {Float} 
     */
    XAxisInDegreesPerSecond {
        get => this.get_XAxisInDegreesPerSecond()
        set => this.put_XAxisInDegreesPerSecond(value)
    }

    /**
     * Gets or sets the minimum change of angular velocity around the y-axis required to reach the threshold, measured in degrees per second.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerdatathreshold.yaxisindegreespersecond
     * @type {Float} 
     */
    YAxisInDegreesPerSecond {
        get => this.get_YAxisInDegreesPerSecond()
        set => this.put_YAxisInDegreesPerSecond(value)
    }

    /**
     * Gets or sets the minimum change of angular velocity around the x-axis required to reach the threshold, measured in degrees per second.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerdatathreshold.zaxisindegreespersecond
     * @type {Float} 
     */
    ZAxisInDegreesPerSecond {
        get => this.get_ZAxisInDegreesPerSecond()
        set => this.put_ZAxisInDegreesPerSecond(value)
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
    get_XAxisInDegreesPerSecond() {
        if (!this.HasProp("__IGyrometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IGyrometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerDataThreshold := IGyrometerDataThreshold(outPtr)
        }

        return this.__IGyrometerDataThreshold.get_XAxisInDegreesPerSecond()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_XAxisInDegreesPerSecond(value) {
        if (!this.HasProp("__IGyrometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IGyrometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerDataThreshold := IGyrometerDataThreshold(outPtr)
        }

        return this.__IGyrometerDataThreshold.put_XAxisInDegreesPerSecond(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YAxisInDegreesPerSecond() {
        if (!this.HasProp("__IGyrometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IGyrometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerDataThreshold := IGyrometerDataThreshold(outPtr)
        }

        return this.__IGyrometerDataThreshold.get_YAxisInDegreesPerSecond()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_YAxisInDegreesPerSecond(value) {
        if (!this.HasProp("__IGyrometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IGyrometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerDataThreshold := IGyrometerDataThreshold(outPtr)
        }

        return this.__IGyrometerDataThreshold.put_YAxisInDegreesPerSecond(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZAxisInDegreesPerSecond() {
        if (!this.HasProp("__IGyrometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IGyrometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerDataThreshold := IGyrometerDataThreshold(outPtr)
        }

        return this.__IGyrometerDataThreshold.get_ZAxisInDegreesPerSecond()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ZAxisInDegreesPerSecond(value) {
        if (!this.HasProp("__IGyrometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IGyrometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerDataThreshold := IGyrometerDataThreshold(outPtr)
        }

        return this.__IGyrometerDataThreshold.put_ZAxisInDegreesPerSecond(value)
    }

;@endregion Instance Methods
}
