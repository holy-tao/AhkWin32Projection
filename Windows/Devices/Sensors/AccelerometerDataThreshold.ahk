#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccelerometerDataThreshold.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to accelerometer data thresholds (also known as change sensitivity).
 * @remarks
 * The threshold values are used to configure how the sensor hardware filters data sent to applications. Applications can configure thresholds to let the hardware filter out any irrelevant changes in the sensor data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerdatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AccelerometerDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccelerometerDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccelerometerDataThreshold.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum amount of acceleration increase or decrease along the x-axis required to reach the threshold, measured in in g-force.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerdatathreshold.xaxisingforce
     * @type {Float} 
     */
    XAxisInGForce {
        get => this.get_XAxisInGForce()
        set => this.put_XAxisInGForce(value)
    }

    /**
     * Gets or sets the minimum amount of acceleration increase or decrease along the y-axis required to reach the threshold, measured in in g-force.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerdatathreshold.yaxisingforce
     * @type {Float} 
     */
    YAxisInGForce {
        get => this.get_YAxisInGForce()
        set => this.put_YAxisInGForce(value)
    }

    /**
     * Gets or sets the minimum amount of acceleration increase or decrease along the z-axis required to reach the threshold, measured in in g-force.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerdatathreshold.zaxisingforce
     * @type {Float} 
     */
    ZAxisInGForce {
        get => this.get_ZAxisInGForce()
        set => this.put_ZAxisInGForce(value)
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
    get_XAxisInGForce() {
        if (!this.HasProp("__IAccelerometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IAccelerometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerDataThreshold := IAccelerometerDataThreshold(outPtr)
        }

        return this.__IAccelerometerDataThreshold.get_XAxisInGForce()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_XAxisInGForce(value) {
        if (!this.HasProp("__IAccelerometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IAccelerometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerDataThreshold := IAccelerometerDataThreshold(outPtr)
        }

        return this.__IAccelerometerDataThreshold.put_XAxisInGForce(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YAxisInGForce() {
        if (!this.HasProp("__IAccelerometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IAccelerometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerDataThreshold := IAccelerometerDataThreshold(outPtr)
        }

        return this.__IAccelerometerDataThreshold.get_YAxisInGForce()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_YAxisInGForce(value) {
        if (!this.HasProp("__IAccelerometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IAccelerometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerDataThreshold := IAccelerometerDataThreshold(outPtr)
        }

        return this.__IAccelerometerDataThreshold.put_YAxisInGForce(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZAxisInGForce() {
        if (!this.HasProp("__IAccelerometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IAccelerometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerDataThreshold := IAccelerometerDataThreshold(outPtr)
        }

        return this.__IAccelerometerDataThreshold.get_ZAxisInGForce()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ZAxisInGForce(value) {
        if (!this.HasProp("__IAccelerometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IAccelerometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerDataThreshold := IAccelerometerDataThreshold(outPtr)
        }

        return this.__IAccelerometerDataThreshold.put_ZAxisInGForce(value)
    }

;@endregion Instance Methods
}
