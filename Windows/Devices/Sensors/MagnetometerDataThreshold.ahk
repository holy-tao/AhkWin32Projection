#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagnetometerDataThreshold.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to magnetometer data thresholds (also known as change sensitivity).
 * @remarks
 * The threshold values are used to configure how the sensor hardware filters data sent to applications. Applications can configure thresholds to let the hardware filter out any irrelevant changes in the sensor data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerdatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class MagnetometerDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagnetometerDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagnetometerDataThreshold.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum change of geomagnetic data around the x-axis required to reach the threshold, measured in microteslas.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerdatathreshold.xaxismicroteslas
     * @type {Float} 
     */
    XAxisMicroteslas {
        get => this.get_XAxisMicroteslas()
        set => this.put_XAxisMicroteslas(value)
    }

    /**
     * Gets or sets the minimum change of geomagnetic data around the y-axis required to reach the threshold, measured in microteslas.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerdatathreshold.yaxismicroteslas
     * @type {Float} 
     */
    YAxisMicroteslas {
        get => this.get_YAxisMicroteslas()
        set => this.put_YAxisMicroteslas(value)
    }

    /**
     * Gets or sets the minimum change of geomagnetic data around the z-axis required to reach the threshold, measured in microteslas.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerdatathreshold.zaxismicroteslas
     * @type {Float} 
     */
    ZAxisMicroteslas {
        get => this.get_ZAxisMicroteslas()
        set => this.put_ZAxisMicroteslas(value)
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
    get_XAxisMicroteslas() {
        if (!this.HasProp("__IMagnetometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IMagnetometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerDataThreshold := IMagnetometerDataThreshold(outPtr)
        }

        return this.__IMagnetometerDataThreshold.get_XAxisMicroteslas()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_XAxisMicroteslas(value) {
        if (!this.HasProp("__IMagnetometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IMagnetometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerDataThreshold := IMagnetometerDataThreshold(outPtr)
        }

        return this.__IMagnetometerDataThreshold.put_XAxisMicroteslas(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YAxisMicroteslas() {
        if (!this.HasProp("__IMagnetometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IMagnetometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerDataThreshold := IMagnetometerDataThreshold(outPtr)
        }

        return this.__IMagnetometerDataThreshold.get_YAxisMicroteslas()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_YAxisMicroteslas(value) {
        if (!this.HasProp("__IMagnetometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IMagnetometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerDataThreshold := IMagnetometerDataThreshold(outPtr)
        }

        return this.__IMagnetometerDataThreshold.put_YAxisMicroteslas(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZAxisMicroteslas() {
        if (!this.HasProp("__IMagnetometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IMagnetometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerDataThreshold := IMagnetometerDataThreshold(outPtr)
        }

        return this.__IMagnetometerDataThreshold.get_ZAxisMicroteslas()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ZAxisMicroteslas(value) {
        if (!this.HasProp("__IMagnetometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IMagnetometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerDataThreshold := IMagnetometerDataThreshold(outPtr)
        }

        return this.__IMagnetometerDataThreshold.put_ZAxisMicroteslas(value)
    }

;@endregion Instance Methods
}
