#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInclinometerDataThreshold.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to inclinometer data thresholds (also known as change sensitivity).
 * @remarks
 * The threshold values are used to configure how the sensor hardware filters data sent to applications. Applications can configure thresholds to let the hardware filter out any irrelevant changes in the sensor data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerdatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class InclinometerDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInclinometerDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInclinometerDataThreshold.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum change in rotation around the pitch-axis (transverse axis) required to reach the threshold, measured in degrees.
     * @remarks
     * Pitch rotation is a change in angle around the transverse axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerdatathreshold.pitchindegrees
     * @type {Float} 
     */
    PitchInDegrees {
        get => this.get_PitchInDegrees()
        set => this.put_PitchInDegrees(value)
    }

    /**
     * Gets or sets the minimum change in rotation around the roll-axis (longitudinal axis) required to reach the threshold, measured in degrees.
     * @remarks
     * Roll rotation is a change in angle around the longitudinal axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerdatathreshold.rollindegrees
     * @type {Float} 
     */
    RollInDegrees {
        get => this.get_RollInDegrees()
        set => this.put_RollInDegrees(value)
    }

    /**
     * Gets or sets the minimum change of rotation around the yaw-axis (vertical axis) required to reach the threshold, measured in degrees.
     * @remarks
     * Yaw rotation is a change in pointing direction around the vertical axis, to the left or right of the direction of motion.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerdatathreshold.yawindegrees
     * @type {Float} 
     */
    YawInDegrees {
        get => this.get_YawInDegrees()
        set => this.put_YawInDegrees(value)
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
    get_PitchInDegrees() {
        if (!this.HasProp("__IInclinometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IInclinometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerDataThreshold := IInclinometerDataThreshold(outPtr)
        }

        return this.__IInclinometerDataThreshold.get_PitchInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PitchInDegrees(value) {
        if (!this.HasProp("__IInclinometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IInclinometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerDataThreshold := IInclinometerDataThreshold(outPtr)
        }

        return this.__IInclinometerDataThreshold.put_PitchInDegrees(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RollInDegrees() {
        if (!this.HasProp("__IInclinometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IInclinometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerDataThreshold := IInclinometerDataThreshold(outPtr)
        }

        return this.__IInclinometerDataThreshold.get_RollInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RollInDegrees(value) {
        if (!this.HasProp("__IInclinometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IInclinometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerDataThreshold := IInclinometerDataThreshold(outPtr)
        }

        return this.__IInclinometerDataThreshold.put_RollInDegrees(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YawInDegrees() {
        if (!this.HasProp("__IInclinometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IInclinometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerDataThreshold := IInclinometerDataThreshold(outPtr)
        }

        return this.__IInclinometerDataThreshold.get_YawInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_YawInDegrees(value) {
        if (!this.HasProp("__IInclinometerDataThreshold")) {
            if ((queryResult := this.QueryInterface(IInclinometerDataThreshold.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerDataThreshold := IInclinometerDataThreshold(outPtr)
        }

        return this.__IInclinometerDataThreshold.put_YawInDegrees(value)
    }

;@endregion Instance Methods
}
