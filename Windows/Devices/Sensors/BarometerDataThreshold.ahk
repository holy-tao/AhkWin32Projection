#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarometerDataThreshold.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to barometer data thresholds (also known as change sensitivity).
 * @remarks
 * The threshold values are used to configure how the sensor hardware filters data sent to applications. Applications can configure thresholds to let the hardware filter out any irrelevant changes in the sensor data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerdatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class BarometerDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarometerDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarometerDataThreshold.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum amount of barometric pressure increase or decrease required to reach the threshold, measured in in hectopascals.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerdatathreshold.hectopascals
     * @type {Float} 
     */
    Hectopascals {
        get => this.get_Hectopascals()
        set => this.put_Hectopascals(value)
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
    get_Hectopascals() {
        if (!this.HasProp("__IBarometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IBarometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarometerDataThreshold := IBarometerDataThreshold(outPtr)
        }

        return this.__IBarometerDataThreshold.get_Hectopascals()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Hectopascals(value) {
        if (!this.HasProp("__IBarometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IBarometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarometerDataThreshold := IBarometerDataThreshold(outPtr)
        }

        return this.__IBarometerDataThreshold.put_Hectopascals(value)
    }

;@endregion Instance Methods
}
