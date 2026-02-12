#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILightSensorDataThreshold.ahk
#Include .\ILightSensorDataThreshold2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to light data thresholds (also known as change sensitivity).
 * @remarks
 * The threshold values are used to configure how the sensor hardware filters data sent to applications. Applications can configure thresholds to let the hardware filter out any irrelevant changes in the sensor data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensordatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class LightSensorDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILightSensorDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILightSensorDataThreshold.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum change in light (lux) required to reach the threshold, measured in percent.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensordatathreshold.luxpercentage
     * @type {Float} 
     */
    LuxPercentage {
        get => this.get_LuxPercentage()
        set => this.put_LuxPercentage(value)
    }

    /**
     * Gets or sets the minimum change in light (lux) required to reach the threshold, measured in absolute units of lux.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensordatathreshold.absolutelux
     * @type {Float} 
     */
    AbsoluteLux {
        get => this.get_AbsoluteLux()
        set => this.put_AbsoluteLux(value)
    }

    /**
     * Gets or sets the minimum change in chromaticity (x and y) which is required to reach the threshold. The values x and y are coordinates in the CIE xyY color space.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensordatathreshold.chromaticity
     * @type {LightSensorChromaticity} 
     */
    Chromaticity {
        get => this.get_Chromaticity()
        set => this.put_Chromaticity(value)
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
    get_LuxPercentage() {
        if (!this.HasProp("__ILightSensorDataThreshold")) {
            if ((queryResult := this.QueryInterface(ILightSensorDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorDataThreshold := ILightSensorDataThreshold(outPtr)
        }

        return this.__ILightSensorDataThreshold.get_LuxPercentage()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LuxPercentage(value) {
        if (!this.HasProp("__ILightSensorDataThreshold")) {
            if ((queryResult := this.QueryInterface(ILightSensorDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorDataThreshold := ILightSensorDataThreshold(outPtr)
        }

        return this.__ILightSensorDataThreshold.put_LuxPercentage(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AbsoluteLux() {
        if (!this.HasProp("__ILightSensorDataThreshold")) {
            if ((queryResult := this.QueryInterface(ILightSensorDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorDataThreshold := ILightSensorDataThreshold(outPtr)
        }

        return this.__ILightSensorDataThreshold.get_AbsoluteLux()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AbsoluteLux(value) {
        if (!this.HasProp("__ILightSensorDataThreshold")) {
            if ((queryResult := this.QueryInterface(ILightSensorDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorDataThreshold := ILightSensorDataThreshold(outPtr)
        }

        return this.__ILightSensorDataThreshold.put_AbsoluteLux(value)
    }

    /**
     * 
     * @returns {LightSensorChromaticity} 
     */
    get_Chromaticity() {
        if (!this.HasProp("__ILightSensorDataThreshold2")) {
            if ((queryResult := this.QueryInterface(ILightSensorDataThreshold2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorDataThreshold2 := ILightSensorDataThreshold2(outPtr)
        }

        return this.__ILightSensorDataThreshold2.get_Chromaticity()
    }

    /**
     * 
     * @param {LightSensorChromaticity} value 
     * @returns {HRESULT} 
     */
    put_Chromaticity(value) {
        if (!this.HasProp("__ILightSensorDataThreshold2")) {
            if ((queryResult := this.QueryInterface(ILightSensorDataThreshold2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorDataThreshold2 := ILightSensorDataThreshold2(outPtr)
        }

        return this.__ILightSensorDataThreshold2.put_Chromaticity(value)
    }

;@endregion Instance Methods
}
